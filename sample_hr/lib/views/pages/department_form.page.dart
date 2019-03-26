import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_form.controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';

class DepartmentFormPage extends StatefulWidget {
  
  final Department department;
  DepartmentFormPage([this.department]);
  
  @override
  _DepartmentFormPageState createState() => _DepartmentFormPageState();
}

class _DepartmentFormPageState extends State<DepartmentFormPage> {

  DepartmentFormController _controller;

  @override
  void initState() {
    _controller = DepartmentFormController(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MainAppBar(title: widget.department == null ?
                     'New Department' : 'Update Department' ),

      body: Form(
        child: ListView(
          children: <Widget>[
            
          ],
        ),
      ),
      
    );
  }
}