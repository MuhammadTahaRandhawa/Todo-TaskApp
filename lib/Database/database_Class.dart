import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseClass {
  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'tasks.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY,
            title TEXT,
            category TEXT,
            notes TEXT,
            time TEXT,
            durationHr TEXT,
            durationMin TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTasks(String category) async {
    final Database db = await getDatabase();
    return db.query('tasks', where: 'category = ?', whereArgs: [category]);
  }

  Future<void> addTask(
      TextEditingController nameController,
      String? category,
      TextEditingController notesController,
      String time,
      String durationHr,
      String durationMin) async {
    final String title = nameController.text.trim();
    final String notes = notesController.text.trim();
    if(durationHr.isEmpty)
      {
        durationHr= '0';
      }
    if(durationMin.isEmpty)
    {
      durationMin= '0';
    }
    if (title.isNotEmpty) {
      final Database db = await getDatabase();
      await db.insert('tasks', {
        'title': title,
        'category': category,
        'notes': notes,
        'time':time,
        'durationHr':durationHr,
        'durationMin':durationMin
      });

      // setState(() {
      //   nameController.clear();
      //   _tasksFuture = _getTasks();
      // });
    }
  }

  Future<void> deleteTask(int id) async {
    final Database db = await getDatabase();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
