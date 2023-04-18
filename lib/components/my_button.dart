import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Color mycolor;
  final String text;
   const MyButton({Key? key , this.mycolor = const Color(0xff1de9b6) , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(

        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff1de9b6)),
          color: mycolor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child:  Center(child: Text(text , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
