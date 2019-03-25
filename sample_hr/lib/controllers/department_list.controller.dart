import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/department.dart';

class DepartmentListController extends BaseController{
  
  List<Department> departments;

  DepartmentListController(State<StatefulWidget> state) : super(state){

    departments = [
      Department(id:1, nameEn: 'HR', isActive: true),
      Department(id:2, nameEn: 'IT',isActive: false),
      Department(id:3, nameEn: 'Acc', isActive: true),
    ];

  }
  

}