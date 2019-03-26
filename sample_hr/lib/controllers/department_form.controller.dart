import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/department.dart';

class DepartmentFormController extends BaseController{

  var form =GlobalKey<FormState>();

  TextEditingController code;
  TextEditingController nameEn;
  TextEditingController nameAr;
  TextEditingController description;
  Department department;

  var codeValidation = (String val)=> val.isEmpty ? 'Must Insert Code' : null;
  var nameEnValidation = (String val)=> val.isEmpty ? 'Must Insert Arabic Name' : null;
  var nameArValidation = (String val)=> val.isEmpty ? 'Must Insert English Name' : null;
  var descriptionValidation = (String val)=> null;

  DepartmentFormController(State<StatefulWidget> state, 
                          this.department) : super(state){
    
    if (department == null) department = Department(isActive: true);

    code = TextEditingController(text: department?.code ?? '');
    nameEn = TextEditingController(text: department?.nameEn ?? '');
    nameAr = TextEditingController(text: department?.nameAr ?? '');
    description = TextEditingController(text: department?.description ?? '');
    
  }

  Future<void> onSave()async{

    if(form.currentState.validate()){
      print('saving..');
      await Future.delayed(Duration(seconds: 3));
    }
  }

}