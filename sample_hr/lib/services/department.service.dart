import 'dart:convert';
import 'package:sample_hr/models/department.dart';
import 'package:http/http.dart' as http;

class DepartmentService{
  

  Future<List<Department>> getDepartments()async{

    var result = await http.get('http://my-json-server.typicode.com/ahmed-eg/flutter-training-course/departments');
    print('--------------------------------------------');
    print(result.statusCode);
    print(result.body);
    return [];
    // if (result.statusCode == 200) {

    //   var body = jsonDecode(result.body) as List<dynamic>;
      
    //   var departmentList =body
    //       .map((w)=>Department.fromMap(w))
    //       .toList();
      
    //   return departmentList ?? [];
    // }else{
    //   return [];
    // }
  }

}