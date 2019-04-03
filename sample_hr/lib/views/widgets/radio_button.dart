import 'package:flutter/material.dart';

class MainRadioButton extends StatefulWidget {
  final List<String> items;
  final String label;
  final void Function(String) onChange;
  MainRadioButton({this.items,this.label,this.onChange});
  @override
  _MainRadioButtonState createState() => _MainRadioButtonState();
}

class _MainRadioButtonState extends State<MainRadioButton> {
  String _value;

  onChange(val){
    _value = val;
    if(widget.onChange != null) widget.onChange(val);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.label),
        Row(
          children: widget.items.map((item)=> 
              getRadioItem(item))
              .toList()
        )
      ],
    );
  }

  Widget getRadioItem(item){
    return Row(
      children: <Widget>[
        Radio(value: item, groupValue: _value, onChanged: onChange ),
        Text(item),
      ],
    );
  }
}