import 'package:flutter/material.dart';

class MultiLineTextFormField extends StatelessWidget {
  var multiController = TextEditingController();
  MultiLineTextFormField({Key? key ,required this.multiController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: multiController,
      decoration:  InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      minLines: 1,
      maxLines: null,
    );
  }
}
