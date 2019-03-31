import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/template_list.controller.dart';
import 'package:sample_hr/models/base_model.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';
import 'package:sample_hr/views/widgets/search_text.dart';

class TemplateListPage extends StatefulWidget {

  final String title;
  final TemplateListController controller;
  final Widget Function(BaseModel) generateRow;
  TemplateListPage({this.title,this.controller,this.generateRow});

  @override
  _TemplateListPageState createState() => _TemplateListPageState();
}

class _TemplateListPageState extends State<TemplateListPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.controller.key,
        appBar: MainAppBar(title:widget.title),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: widget.controller.onAdd,
        ),
        body: Column(
          children: <Widget>[
            SearchText(widget.controller.searchController, widget.controller.onSearch),
            Expanded(
              child: RefreshIndicator(
                onRefresh: widget.controller.onRefresh,
                child: ListView(
                  children:
                      widget.controller.items.map((d) => getRow(d)).toList(),
                ),
              ),
            ),
          ],
        ));
  }

  Widget getRow(BaseModel d) {
    return Column(
      children: <Widget>[
        widget.generateRow(d),
        Divider()
      ],
    );
  }
}
