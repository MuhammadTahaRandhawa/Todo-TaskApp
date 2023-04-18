import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Database/database_Class.dart';
import 'package:todo_app/components/multilineTextFormField.dart';
import 'package:todo_app/components/singleline_textformfield.dart';
import 'package:todo_app/constanst/colors_class.dart';
import 'package:todo_app/constanst/text_styles.dart';

import 'components/my_button.dart';
import 'screen_one.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late String timeHr = currentHours();
  late String timeMin = DateTime.now().minute.toString();
  late String timeAmPM = aMpM();

  final _durationHrController = TextEditingController();
  final _durationMinController = TextEditingController();
  final _formController = TextEditingController();
  final _notesController = TextEditingController();
  DataBaseClass myDatabase = DataBaseClass();
  String? category;
  List<String> items = ['Academic tasks', 'Workout', 'Events', 'Namaz'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorS2,
      appBar: AppBar(
        backgroundColor: bgColorS2,
        elevation: 0,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          CircleAvatar(
            radius: 15,
            foregroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: mainContainerColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: mainContainerShadowColor,
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(5, -3))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add new task',
                              style: addnewtask,
                            ),
                          ],
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
                        Row(
                          children: [
                            Text(
                              'Task name',
                              style: bodyComponents,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleLineTextFormField(
                            fieldController: _formController),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Category',
                              style: bodyComponents,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value: category,
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                category = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Time',
                              style: bodyComponents,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.8)),
                              ),
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(timeHr),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            int value = int.parse(timeHr);
                                            value++;
                                            if (value > 12) {
                                              value = 1;
                                            }
                                            setState(() {
                                              timeHr = value.toString();
                                            });
                                          },
                                          child:
                                              const Icon(Icons.arrow_drop_up)),
                                      InkWell(
                                          onTap: () {
                                            int value = int.parse(timeHr);
                                            value--;
                                            if (value < 1) {
                                              value = 12;
                                            }
                                            setState(() {
                                              timeHr = value.toString();
                                            });
                                          },
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.8)),
                              ),
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(timeMin),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            int value = int.parse(timeMin);
                                            value++;
                                            if (value > 59) {
                                              value = 0;
                                            }
                                            setState(() {
                                              timeMin = value.toString();
                                            });
                                          },
                                          child:
                                              const Icon(Icons.arrow_drop_up)),
                                      InkWell(
                                          onTap: () {
                                            int value = int.parse(timeMin);
                                            value--;
                                            if (value < 0) {
                                              value = 59;
                                            }
                                            setState(() {
                                              timeMin = value.toString();
                                            });
                                          },
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.8)),
                              ),
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(timeAmPM),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (timeAmPM == 'AM') {
                                              timeAmPM = 'PM';
                                            } else if (timeAmPM == 'PM') {
                                              timeAmPM = 'AM';
                                            }
                                            setState(() {});
                                          },
                                          child:
                                              const Icon(Icons.arrow_drop_up)),
                                      InkWell(
                                          onTap: () {
                                            if (timeAmPM == 'AM') {
                                              timeAmPM = 'PM';
                                            } else if (timeAmPM == 'PM') {
                                              timeAmPM = 'AM';
                                            }
                                            setState(() {});
                                          },
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Duration',
                              style: bodyComponents,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.shade400
                                          .withOpacity(0.8))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                      controller: _durationHrController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                  const Text('Hr')
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.shade400
                                          .withOpacity(0.8))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                      controller: _durationMinController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                  const Text('Min')
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.shade400
                                          .withOpacity(0.8))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                  const Text('Sec')
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Notes',
                              style: bodyComponents,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MultiLineTextFormField(
                            multiController: _notesController),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      String Time =
                                          '$timeHr:$timeMin $timeAmPM';

                                      myDatabase.addTask(
                                          _formController,
                                          category,
                                          _notesController,
                                          Time,
                                          _durationHrController.text,
                                          _durationMinController.text);
                                     Navigator.pop(context);
                                    },
                                    child: const MyButton(text: 'Add'))),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const MyButton(
                                text: 'Back',
                                mycolor: Colors.white,
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  String currentHours() {
    int time = DateTime.now().hour.toInt();
    if (time > 12) {
      time = time % 12;
    }
    return time.toString();
  }

  String aMpM() {
    if (DateTime.now().hour.toInt() > 11) {
      return 'PM';
    } else {
      return 'AM';
    }
  }
}
