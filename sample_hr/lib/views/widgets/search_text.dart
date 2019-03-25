import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {

  final TextEditingController controller;
  final dynamic onChange;
  SearchText(this.controller, this.onChange);

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search ..',
                contentPadding: EdgeInsets.all(15.0),
                prefixIcon:  Icon(Icons.search),
                
              ),
              onChanged: onChange,
            );
  }
}