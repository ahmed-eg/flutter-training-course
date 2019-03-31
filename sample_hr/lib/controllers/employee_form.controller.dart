import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/models/employee.dart';

class EmployeeFormController extends BaseController{

  var form =GlobalKey<FormState>();

  TextEditingController code;
  TextEditingController nameEn;
  TextEditingController nameAr;
  TextEditingController jobTitle;
  TextEditingController salary;
  TextEditingController allownces;
  Employee employee;

  var codeValidation = (String val)=> val.isEmpty ? 'Must Insert Code' : null;
  var nameEnValidation = (String val)=> val.isEmpty ? 'Must Insert Arabic Name' : null;
  var nameArValidation = (String val)=> val.isEmpty ? 'Must Insert English Name' : null;
  var jobTitleValidation = (String val)=> null;
  var salaryValidation = (String val)=> double.tryParse(val) == null ? 'must insert valid integer' : null;
  var allowncesValidation = (String val)=> double.tryParse(val) == null ? 'must insert valid integer' : null;

  EmployeeFormController(State<StatefulWidget> state, 
                          this.employee) : super(state){
    
    if (employee == null) employee = Employee(isActive: true);

    code = TextEditingController(text: employee?.code ?? '');
    nameEn = TextEditingController(text: employee?.nameEn ?? '');
    nameAr = TextEditingController(text: employee?.nameAr ?? '');
    jobTitle = TextEditingController(text: employee?.jobTitle ?? '');
    salary = TextEditingController(text: employee?.basicSalary?.toString() ?? '');
    allownces = TextEditingController(text: employee?.allownces?.toString() ?? '');
    
  }

  Future<void> onSave()async{

    if(form.currentState.validate()){
      print('saving..');
      await Future.delayed(Duration(seconds: 1));
      employee.code = code.text;
      employee.nameAr =nameAr.text;
      employee.nameEn =nameEn.text;
      employee.jobTitle =jobTitle.text;
      employee.basicSalary = double.tryParse(salary.text) ?? 0.0;
      employee.allownces =  double.tryParse(allownces.text) ?? 0.0;
      Navigator.pop(context, employee);
    }
  }

}