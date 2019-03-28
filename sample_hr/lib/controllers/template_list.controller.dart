
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_hr/controllers/base_controller.dart';
import 'package:sample_hr/models/base_model.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';

abstract class TemplateListController extends BaseController {
  List<BaseModel> _items;
  TextEditingController searchController;

  var key =GlobalKey<ScaffoldState>();

  List<BaseModel> get items {
    if (searchController.text.isEmpty) return _items;
    return _items
        .where((d) => d.displayName
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }

  setItems(itms){
    _items = itms;
  }
  
  TemplateListController(State<StatefulWidget> state) : super(state) {
    searchController = TextEditingController();
  }

  onSearch(_) {
    setState();
  }

  onTap(d) async {
    if (await confirmMessage('You sure?')){
      BaseModel result = await navigateTo(() => formPageCreator(d));
      if(result == null)return;
      var index = items.indexOf(d);
      items.removeAt(index);
      items.insert(index,result);
      setState();
      key.currentState.showSnackBar(SnackBar(duration:Duration(seconds: 2) , content:Text('Updated Successfully') ), );
    }
  }

  void onAdd() async{
    BaseModel result = await navigateTo(() => formPageCreator());
    if(result == null)return;
    items.add(result);
    setState();
    key.currentState.showSnackBar(SnackBar(duration:Duration(seconds: 2) ,content:Text('Saved Successfully') ), );

 }

  formPageCreator([model]);
  Future<void> onRefresh();

}
