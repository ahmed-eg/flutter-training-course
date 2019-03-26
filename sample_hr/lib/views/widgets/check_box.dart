import 'package:flutter/material.dart';

class MainCheckBox extends StatefulWidget {
  final String label;
  final bool initValue;
  final void Function(bool) onChange;
  MainCheckBox({this.label, this.initValue, this.onChange});
  @override
  _MainCheckBoxState createState() => _MainCheckBoxState();
}

class _MainCheckBoxState extends State<MainCheckBox> {
  bool value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  onChange(val){
    widget.onChange(val);
    value = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
      children: <Widget>[
        Checkbox(
          value: value,
          onChanged: onChange,
        ),
        SizedBox(width:15.0),
        GestureDetector(
          child: Text(widget.label),
          onTap: ()=>onChange(!value),
        )
      ],
    ));
  }
}
