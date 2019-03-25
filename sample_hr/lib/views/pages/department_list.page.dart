import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_list.controller.dart';

class DepartmentListPage extends StatefulWidget {
  @override
  _DepartmentListPageState createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {

  DepartmentListController _controller;

  @override
  void initState() {
    _controller =DepartmentListController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Department List'),),
      
    );

  }
}