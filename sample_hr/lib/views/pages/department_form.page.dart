import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/department_form.controller.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';
import 'package:sample_hr/views/widgets/button.dart';
import 'package:sample_hr/views/widgets/check_box.dart';
import 'package:sample_hr/views/widgets/text_form_field.dart';

class DepartmentFormPage extends StatefulWidget {
  final Department department;
  DepartmentFormPage([this.department]);

  @override
  _DepartmentFormPageState createState() => _DepartmentFormPageState();
}

class _DepartmentFormPageState extends State<DepartmentFormPage> {
  DepartmentFormController _controller;

  @override
  void initState() {
    _controller = DepartmentFormController(this, widget.department);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: widget.department == null
              ? 'New Department'
              : 'Update Department'),
      body: Form(
        key:_controller.form,
        child: ListView(
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
                label: 'Description', 
                validator: _controller.descriptionValidation,
                multiLines: true,
                controller: _controller.description),
            MainCheckBox(
              label: 'Is Active',
              initValue: _controller.department.isActive,
              onChange: (value)=>_controller.department.isActive =value,
            ),
            MainButton(label:'Save', callBack: _controller.onSave)
          ],
        ),
      ),
    );
  }
}
