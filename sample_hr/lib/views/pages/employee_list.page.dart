import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/employee_list.controller.dart';
import 'package:sample_hr/models/employee.dart';
import 'package:sample_hr/views/pages/template_list.page.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  EmployeeListController _controller;

  @override
  void initState() {
    _controller = EmployeeListController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateListPage(
      title: 'Employee List',
      controller: _controller,
      generateRow: (item)=> getRow(item),
    );
  }

  Widget getRow(Employee d){
    return 
     ListTile(
          title: Text(d.nameEn,
              style: TextStyle(color: d.isActive ? Colors.black : Colors.red)),
          subtitle: Text(d.jobTitle),
          trailing: Text(d.code,
              style: TextStyle(color: d.isActive ? Colors.black : Colors.red)),
          onTap: () => _controller.onTap(d),
        );
  }

}
