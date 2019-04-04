import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar(context,{title,bottom,List<Widget> actions})
      : super(
          title: Text(title,),
          bottom:bottom,
          actions:actions
        );
}
