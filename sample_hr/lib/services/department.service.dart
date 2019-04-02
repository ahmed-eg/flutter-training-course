import 'dart:convert';
import 'package:sample_hr/helpers/operation_result.dart';
import 'package:sample_hr/models/department.dart';
import 'package:http/http.dart' as http;

class DepartmentService {
  Future<OperationResult<List<Department>>> getDepartments() async {
    try {
      var result = await http.get(
          'http://my-json-server.typicode.com/ahmed-eg/flutter-training-course/departments');
      
      if (result.statusCode != 200) {
        return OperationResult(
            success: false, message: result.statusCode.toString());
      }
      
      var body = jsonDecode(result.body) as List<dynamic>;

      var departmentList =
          body.map<Department>((d) => Department.fromMap(d)).toList();

      return OperationResult(success: true, data: departmentList);
    } catch (err) {
      return OperationResult(success: false, message: err.toString());
    }
  }
}
