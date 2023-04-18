import 'package:flutter/material.dart';
import 'package:todo_app/constanst/text_styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:todo_app/screen_one.dart';

import 'constanst/colors_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Color(0xfff0fffb),
          appBar: AppBar(
            title: RichText(
                text: TextSpan(
                    text: 'Welcome back!',
                    style: appbarHead,
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Muhammad Taha',
                    style: appbarName,
                  )
                ])),
            backgroundColor: HomeBodyColor,
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff1de9b6), Colors.tealAccent]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: mainContainerShadowColor,
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(5, 5))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next Task',
                            style: appbarHead,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Algo Lec 2',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '2:30PM 2HRs',
                            style: appbarName,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.task,
                        size: 100,
                      )
                    ],
                  ),
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Daily tasks',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text('Weekly tasks',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text('Monthly tasks',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenOne(
                                    constructorString: 'Academic tasks')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                                color: HomeBodyColor,
                                border: Border.all(color: Color(0xff1de9b6)),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xff1de9b6),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(5, 5))
                                ]),
                            child: const ListTile(
                              title: Text('Academic tasks'),
                              trailing: badges.Badge(
                                badgeContent: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('3'),
                                ),
                                badgeStyle:
                                    badges.BadgeStyle(badgeColor: Colors.grey),
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenOne(
                                    constructorString: 'Workout')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                                color: HomeBodyColor,
                                border: Border.all(color: Color(0xff1de9b6)),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xff1de9b6),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(5, 5))
                                ]),
                            child: const ListTile(
                              title: Text('Workout'),
                              trailing: badges.Badge(
                                badgeContent: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('3'),
                                ),
                                badgeStyle:
                                    badges.BadgeStyle(badgeColor: Colors.grey),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenOne(
                                      constructorString: 'Events')));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                                color: HomeBodyColor,
                                border: Border.all(color: Color(0xff1de9b6)),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xff1de9b6),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(5, 5))
                                ]),
                            child: const ListTile(
                              title: Text('Events'),
                              trailing: badges.Badge(
                                badgeContent: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('3'),
                                ),
                                badgeStyle:
                                    badges.BadgeStyle(badgeColor: Colors.grey),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenOne(
                                      constructorString: 'Namaz')));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                                color: HomeBodyColor,
                                border: Border.all(color: Color(0xff1de9b6)),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xff1de9b6),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(5, 5))
                                ]),
                            child: const ListTile(
                              title: Text('Namaz'),
                              trailing: badges.Badge(
                                badgeContent: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('3'),
                                ),
                                badgeStyle:
                                    badges.BadgeStyle(badgeColor: Colors.grey),
                              ),
                            )),
                      ),
                    )
                  ]),
                  Text('2nd Tab'),
                  Text('3rd Tab')
                ]),
              )
            ],
          )),
    );
  }
}
