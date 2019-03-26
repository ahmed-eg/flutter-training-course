
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool multiLines;
  final String Function(String) validator;
  MainTextFormField({this.validator,this.multiLines = false, this.controller,this.label,this.keyboardType =TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: multiLines ? 3 : 1,
      controller: controller,
      validator: validator,
      keyboardType:keyboardType ,
      decoration: InputDecoration(
        labelText: label
      ),
    );
  }
}


// class MainTextFormField2 extends TextFormField {
//     MainTextFormField2():super();
// }