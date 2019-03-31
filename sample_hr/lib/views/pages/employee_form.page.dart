import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_form.controller.dart';
import 'package:sample_hr/controllers/employee_form.controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/models/employee.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';
import 'package:sample_hr/views/widgets/button.dart';
import 'package:sample_hr/views/widgets/check_box.dart';
import 'package:sample_hr/views/widgets/text_form_field.dart';

class EmployeeFormPage extends StatefulWidget {
  final Employee employee;
  EmployeeFormPage([this.employee]);

  @override
  _EmployeeFormPageState createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  EmployeeFormController _controller;

  @override
  void initState() {
    _controller = EmployeeFormController(this, widget.employee);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
      appBar: MainAppBar(
          title: widget.employee == null
              ? 'New Employee'
              : 'Update Employee',
              bottom: TabBar(
                labelPadding: EdgeInsets.all(5.0),
                tabs: <Widget>[
                  Text('Personal'),
                  Text('Financal'),
                  Text('Groups'),
                ],
              ),),
      body: Form(
        key:_controller.form,
        child: TabBarView(
          children: <Widget>[
            getPersonal(),
            getFinancial(),
            getGroups()
          ],
        ),
      ),
      bottomSheet:
      
      Container(
        height: 90.0,
        padding: EdgeInsets.only(bottom: 20.0),
        child:Align(
          alignment: Alignment.bottomCenter,
          child:
       MainButton(label:'Save', callBack: _controller.onSave)),
      )
,
    ));
  }

  getPersonal(){
    return ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          children: <Widget>[
            MainTextFormField(
              label: 'Code',
              controller: _controller.code,
              validator: _controller.codeValidation,
              keyboardType: TextInputType.number,
            ),
            MainTextFormField(
              label: 'Arabic Name',
              validator: _controller.nameArValidation,
              controller: _controller.nameAr,
            ),
            MainTextFormField(
              label: 'English Name',
              validator: _controller.nameEnValidation,
              controller: _controller.nameEn,
            ),
            MainTextFormField(
                label: 'Job Title', 
                validator: _controller.jobTitleValidation,
                //multiLines: true,
                controller: _controller.jobTitle),
            MainCheckBox(
              label: 'Is Active',
              initValue: _controller.employee.isActive,
              onChange: (value)=>_controller.employee.isActive =value,
            ),
          ],
        );
  }


  getFinancial(){
    return ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          children: <Widget>[
            MainTextFormField(
              label: 'Salary',
              controller: _controller.salary,
              validator: _controller.salaryValidation,
              keyboardType: TextInputType.number,
            ),
            MainTextFormField(
              label: 'Allownces',
              validator: _controller.allowncesValidation,
              controller: _controller.allownces,
              keyboardType: TextInputType.number,
            ),
          ]
        );
  }

  getGroups(){
    return Text('TODO: Groups');
  }
}
