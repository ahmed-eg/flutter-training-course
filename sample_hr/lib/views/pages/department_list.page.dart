import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_list.controller.dart';
import 'package:sample_hr/views/widgets/search_text.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Department List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _controller.onAdd,
        ),
        body: Column(
          children: <Widget>[
            SearchText(_controller.searchController, _controller.onSearch),
            Expanded(child: ListView(
              children: _controller.departments
                  .map((d) => ListTile(
                        title: Text(d.nameEn,
                            style: TextStyle(
                                color: d.isActive ? Colors.black : Colors.red)),
                        subtitle: Text('Department description'),
                        trailing: Text(d.code,
                            style: TextStyle(
                                color: d.isActive ? Colors.black : Colors.red)),
                        onTap: () => _controller.onTap(d),
                      ))
                  .toList(),
            ),
            ),
          ],
        ));
  }
}
