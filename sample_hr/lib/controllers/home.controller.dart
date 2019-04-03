import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/services/department.service.dart';
import 'package:sample_hr/views/pages/department_list.page.dart';
import 'package:sample_hr/views/pages/employee_list.page.dart';

class HomeController extends BaseController{
  
  var key =GlobalKey<ScaffoldState>();
  DepartmentService _departmentService;
  // int departmentCount;

  HomeController(State<StatefulWidget> state) : super(state){

    _departmentService = DepartmentService();

    _departmentService.getDepartments();
      // .then((result){
      //   if(!result.success) 
      //   {
      //     showMessage('Error!');
      //     return;
      //   }
      //   departmentCount = result.data.length;
      //   setState();
      // });

      // DepartmentService.countStream.listen((count){
      //   departmentCount = count;
      //   setState();
      // });

  }

  onDepartment(){
    Navigator.pop(context);
    navigateTo(()=>DepartmentListPage());
  }

  onEmployee(){
    Navigator.pop(context);
    navigateTo(()=>EmployeeListPage());
  }

}