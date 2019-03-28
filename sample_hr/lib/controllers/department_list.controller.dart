import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/controllers/template_list.controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';

class DepartmentListController extends TemplateListController {
  

  DepartmentListController(State<StatefulWidget> state) : super(state) {
    
    setItems( [
      Department(id: 1, code: '101', nameEn: 'HR', isActive: true),
      Department(id: 2, code: '102', nameEn: 'IT', isActive: false),
      Department(id: 3, code: '103', nameEn: 'Acc', isActive: true),
    ]);
  }

  formPageCreator([model])=>DepartmentFormPage(model);
  
  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState();
  }

}
