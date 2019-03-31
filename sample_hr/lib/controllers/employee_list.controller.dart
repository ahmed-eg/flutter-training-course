import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/template_list.controller.dart';
import 'package:sample_hr/models/employee.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';
import 'package:sample_hr/views/pages/employee_form.page.dart';

class EmployeeListController extends TemplateListController {
  

  EmployeeListController(State<StatefulWidget> state) : super(state) {
    
    setItems( [
      Employee(id: 1,jobTitle: 'help desk',code: '101', nameEn: 'first empl', isActive: true),
      Employee(id: 2,jobTitle: 'help desk', code: '102', nameEn: 'ssss', isActive: false),
      Employee(id: 3,jobTitle: 'help desk', code: '103', nameEn: 'tttt', isActive: true),
    ]);
  }

  formPageCreator([model])=>EmployeeFormPage(model);
  
  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState();
  }

}
