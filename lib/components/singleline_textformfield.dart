import 'package:flutter/material.dart';

class SingleLineTextFormField extends StatelessWidget {
  var fieldController = TextEditingController();
  SingleLineTextFormField({Key? key, required this.fieldController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
