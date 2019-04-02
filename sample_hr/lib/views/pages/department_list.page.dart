import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_list.controller.dart';
import 'package:sample_hr/views/pages/template_list.page.dart';

class DepartmentListPage extends StatefulWidget {
  @override
  _DepartmentListPageState createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {
  DepartmentListController _controller;

  @override
  void initState() {
    _controller = DepartmentListController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateListPage(
      title: 'Department List',
      controller: _controller,
      generateRow: getRow,
    );
  }

  Widget getRow(dynamic d){
    return ListTile(
          title: Text(d.nameEn,
              style: TextStyle(color: d.isActive ? Colors.black : Colors.red)),
          subtitle: Text(d.description),
          trailing: Text(d.code,
              style: TextStyle(color: d.isActive ? Colors.black : Colors.red)),
          onTap: () => _controller.onTap(d),
        );
  }

}
