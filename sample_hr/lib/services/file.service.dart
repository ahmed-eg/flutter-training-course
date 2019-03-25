import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService{

  saveJson(module,Map data) async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    //String appDocPath = appDocDir.path;
    var file =File('${appDocDir.path}/$module.json');
    await file.writeAsString(json.encode(data),flush: true);
  }

  getJson(module,) async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    //String appDocPath = appDocDir.path;
    var file =File('${appDocDir.path}/$module.json');
    var data = await file.readAsString();

    return json.decode(data);
  }

}