import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';

class DepartmentListController extends BaseController {
  List<Department> _departments;
  TextEditingController searchController;

  List<Department> get departments {
    if (searchController.text.isEmpty) return _departments;
    return _departments
        .where((d) => d.displayName
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }

  DepartmentListController(State<StatefulWidget> state) : super(state) {
    searchController = TextEditingController();

    _departments = [
      Department(id: 1, code: '101', nameEn: 'HR', isActive: true),
      Department(id: 2, code: '102', nameEn: 'IT', isActive: false),
      Department(id: 3, code: '103', nameEn: 'Acc', isActive: true),
    ];
  }

  onSearch(_) {
    setState();
  }

  onTap(Department d) async {
    if (await confirmMessage('You sure?')){
      Department result = await navigateTo(() => DepartmentFormPage(d));
      if(result == null)return;
      var index = departments.indexOf(d);
      departments.removeAt(index);
      departments.insert(index,result);
      setState();
    }
  }

  void onAdd() async{
    Department result = await navigateTo(() => DepartmentFormPage());
    if(result == null)return;
    departments.add(result);
    setState();
 }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState();
  }

}
