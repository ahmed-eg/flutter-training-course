import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/views/pages/department_list.page.dart';
import 'package:sample_hr/views/pages/employee_list.page.dart';

class HomeController extends BaseController{
  
  var key =GlobalKey<ScaffoldState>();

  HomeController(State<StatefulWidget> state) : super(state);

  onDepartment(){
    Navigator.pop(context);
    navigateTo(()=>DepartmentListPage());
  }

  onEmployee(){
    Navigator.pop(context);
    navigateTo(()=>EmployeeListPage());
  }
}