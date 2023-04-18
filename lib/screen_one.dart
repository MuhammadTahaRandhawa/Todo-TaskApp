import 'package:flutter/material.dart';
import 'package:todo_app/constanst/colors_class.dart';
import 'package:todo_app/constanst/text_styles.dart';
import 'package:todo_app/screen_two.dart';
import 'Database/database_Class.dart';

class ScreenOne extends StatefulWidget {
   ScreenOne({Key? key ,required this.constructorString}) : super(key: key);
   String constructorString;

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  late Future<List<Map<String, dynamic>>> _tasksFuture;
  DataBaseClass myDatabase = DataBaseClass();
  bool isRefresh= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tasksFuture = myDatabase.getTasks(widget.constructorString);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingbuttonColor,
        onPressed: () async{
          await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScreenTwo()));
          setState(() {
            _tasksFuture = myDatabase.getTasks(widget.constructorString);
          });

        },

        elevation: 10.0,
        // Set elevation value as per your preference
        shape: const CircleBorder(),
        child: const Icon(
            Icons.add), // Set shape to CircleBorder for circular shape
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: ScreenOneBodyColor,
      appBar: AppBar(
        backgroundColor: ScreenOneBodyColor,
        elevation: 0,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tasks',
                  style: header,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: FractionallySizedBox(
              widthFactor: 0.4,
              child: Divider(
                thickness: 3,
                height: 5,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
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
                      String _durationHr = task['durationHr'];
                      String _durationMin = task['durationMin'];
                      String _FinalDuration = ' ';
                      if(int.parse(_durationHr)==0)
                        {
                          _FinalDuration = '${_durationMin}Mins';
                        }
                      else if(int.parse(_durationHr)>0)
                        {
                          _FinalDuration = '$_durationHr,${_durationMin.substring(0 ,1)}HRs';
                        }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: 0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ScreenTwo()));
                            },
                            child: ListTile(
                                leading: const Icon(Icons.check_circle),
                                title: Text(task['title'], style: listTileTitle,),
                                subtitle: Text(task['notes'] , style: listTileSubtitle,),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.pink.shade50.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(task['time']),
                                        Text(_FinalDuration),
                                      ],
                                    ),
                                  ),
                                )

                                // IconButton(
                                //     icon: const Icon(Icons.delete),
                                //     onPressed: () {
                                //       myDatabase.deleteTask(task['id']);
                                //       setState(() {
                                //         _tasksFuture = myDatabase.getTasks();
                                //       });
                                //     }),
                                ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
