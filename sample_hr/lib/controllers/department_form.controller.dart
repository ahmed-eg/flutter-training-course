import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/services/department.service.dart';

class DepartmentFormController extends BaseController{

  var form =GlobalKey<FormState>();

  TextEditingController code;
  TextEditingController nameEn;
  TextEditingController nameAr;
  TextEditingController description;
  Department department;
  DepartmentService _service;
  var codeValidation = (String val)=> val.isEmpty ? 'Must Insert Code' : null;
  var nameEnValidation = (String val)=> val.isEmpty ? 'Must Insert Arabic Name' : null;
  var nameArValidation = (String val)=> val.isEmpty ? 'Must Insert English Name' : null;
  var descriptionValidation = (String val)=> null;

  DepartmentFormController(State<StatefulWidget> state, 
                          this.department) : super(state){
    
    _service = DepartmentService();
    if (department == null) department = Department(id:0,isActive: true);

    code = TextEditingController(text: department?.code ?? '');
    nameEn = TextEditingController(text: department?.nameEn ?? '');
    nameAr = TextEditingController(text: department?.nameAr ?? '');
    description = TextEditingController(text: department?.description ?? '');
    
  }

  Future<void> onSave()async{

    if(form.currentState.validate()){
      print('saving..');
      await Future.delayed(Duration(seconds: 1));
      department.code = code.text;
      department.nameAr =nameAr.text;
      department.nameEn =nameEn.text;
      department.description =description.text;

      if(department.id ==0) 
        _service.addDepartment(department);

      Navigator.pop(context, department);
    }
  }

}