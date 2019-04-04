import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/services/department.service.dart';
import 'package:sample_hr/views/pages/department_list.page.dart';
import 'package:sample_hr/views/pages/employee_list.page.dart';

class HomeController extends BaseController{
  
  AnimationController controller;
  Animation<double> sizeAnimation;
  static const double size=800.0;
  double size1=0;
  double size2=0;
  double size3=0;
  double size4=0;  

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

    
    // apply animation
    controller = AnimationController(vsync: state as SingleTickerProviderStateMixin, duration: Duration(milliseconds: 500));
    sizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
     controller.addListener(() {
      size1 = size * getValue(sizeAnimation.value,0.3);
      size2 = size * 2 * getValue(sizeAnimation.value,0.20);
      size3 = size * 4 * getValue(sizeAnimation.value,0.10);
      size4 = size * 8 * sizeAnimation.value;
       setState();
     });
    refreshAnimation();
  }
 
  getValue(double value, double th){
    if(value < th) return 0;
    return value;
  }

  refreshAnimation(){
    size1=size;
   size2=size*2;
   size3=size*3;
   size4=size*4;
   controller.reset();
   controller.forward();
  }

  onRefresh(){
    refreshAnimation();
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