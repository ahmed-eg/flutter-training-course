import 'package:sample_hr/models/base_model.dart';
import 'package:sample_hr/models/department.dart';

class Employee extends BaseModel{

  @override
  String get displayName => '$code $nameEn';

  Employee({id, isActive = false,this.code,this.nameAr,this.nameEn, 
    this.jobTitle, this.basicSalary, this.allownces,this.groupIds, 
    this.departmentId});

  String code;
  String nameAr;
  String nameEn;
  String jobTitle;

  double basicSalary;
  double allownces;
  double get totalSalary => basicSalary + allownces;

  int departmentId;
  Department department;

  List<int> groupIds;
  // List<Group> groups;



}