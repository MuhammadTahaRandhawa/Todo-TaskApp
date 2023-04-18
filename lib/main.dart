import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/components/dropdownbutton2.dart';
import 'package:todo_app/screen_two.dart';

import 'screen_one.dart';
import 'home_screen.dart';

void main() {
 //  String timeString = "10:30";
 //  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
 //  String dateTimeString = today + " " + timeString;
 //  DateTime parsedDateTime = DateTime.parse(dateTimeString);
 // print(parsedDateTime);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SQLite Demo',
      home: HomeScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
   late Future<List<Map<String, dynamic>>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = _getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addTask,
              child: Text('Add Task'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _tasksFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return ListTile(
                          title: Text(task['title']),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteTask(task['id']),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Database> _getDatabase() async {
    final String path = join(await getDatabasesPath(), 'tasks.db');
    return openDatabase(path, version: 1, onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY,
            title TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> _getTasks() async {
    final Database db = await _getDatabase();
    return db.query('tasks');
  }

  Future<void> _addTask() async {
    final String title = _textEditingController.text.trim();
    if (title.isNotEmpty) {
      final Database db = await _getDatabase();
      await db.insert('tasks', {'title': title});
      setState(() {
        _textEditingController.clear();
        _tasksFuture = _getTasks();
      });
    }
  }

  Future<void> _deleteTask(int id) async {
    final Database db = await _getDatabase();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
    setState(() {
      _tasksFuture = _getTasks();
    });
  }
}
