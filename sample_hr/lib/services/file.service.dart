import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService{

  Directory appDocDir;

  saveJson(String module,Map data) async{
    if(appDocDir == null) appDocDir = await getApplicationDocumentsDirectory();
    var file =File('${appDocDir.path}/$module.json');
    await file.writeAsString(json.encode(data),flush: true);
  }

  getJson(String module) async{
    if(appDocDir == null) appDocDir = await getApplicationDocumentsDirectory();
    var file =File('${appDocDir.path}/$module.json');
    var data = await file.readAsString();

    return json.decode(data);
  }

}