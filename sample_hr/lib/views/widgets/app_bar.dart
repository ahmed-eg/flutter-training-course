import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({title,bottom})
      : super(
          title: Text(title),
          bottom:bottom
        );
}
