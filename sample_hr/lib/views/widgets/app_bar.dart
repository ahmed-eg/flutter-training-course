import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar(context,{title,bottom})
      : super(
          title: Text(title,),
          bottom:bottom
        );
}
