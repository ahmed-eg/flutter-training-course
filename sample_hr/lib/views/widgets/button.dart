import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  
  final String label;
  final Future<void> Function() callBack;

  MainButton({this.label,this.callBack});
  
  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {

  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child:RaisedButton(
                  color: _isBusy ? Colors.white :  Colors.blue,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  onPressed: ()async{
                    if(_isBusy) return;

                    setState(() {
                      _isBusy = true;
                    });

                    await widget.callBack();

                    setState(() {
                      _isBusy = false;
                    });
                  },
                  child: _isBusy ? CircularProgressIndicator() 
                      : Text(widget.label, style: TextStyle(color: Colors.white)
                  ),
                ));
  }
}