
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  MainTextFormField({this.controller,this.label,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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