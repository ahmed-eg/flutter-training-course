import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/template_list.controller.dart';
import 'package:sample_hr/services/department.service.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';

class DepartmentListController extends TemplateListController {
  
  DepartmentService _service;

  DepartmentListController(State<StatefulWidget> state) : super(state) {
    _service =DepartmentService();
    onRefresh();
    // setItems( [
    //   Department(id: 1, code: '101', nameEn: 'HR', isActive: true),
    //   Department(id: 2, code: '102', nameEn: 'IT', isActive: false),
    //   Department(id: 3, code: '103', nameEn: 'Acc', isActive: true),
    // ]);
  }

  formPageCreator([model])=>DepartmentFormPage(model);
  
  Future<void> onRefresh() async{
    errorMessage = null;
    
    var result = await _service.getDepartments();

    if(!result.success)
      errorMessage = result.message;
    else
      setItems(result.data);

    setState();
  }

}
