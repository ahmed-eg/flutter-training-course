import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_hr/helpers/message_type.dart';
import 'package:sample_hr/services/navigation.service.dart';

abstract class BaseController{

  bool busy = false;
  String errorMessage;
  
  void dispose(){

  }

  State state;
  BuildContext _context;
  void Function (VoidCallback) setStateFunction;
  BuildContext get context{
    return _context ?? state.context;
  }

  BaseController(this.state, {buildContext}) : assert(state != null || buildContext != null){
    _context = buildContext;
  }

  Future<dynamic> navigateTo(creator, [bool replacment = false,AnimationTypes animationType = AnimationTypes.slideLeft]){
    
    return AppNavigation.navigateTo(context, creator,replacment:replacment, animationType:animationType);

  }

  setState(){    
    if(setStateFunction != null)setStateFunction((){});
    else
    if(state != null && state.mounted) state.setState((){});
  }
  
  Future<dynamic> showMessage(String title, {String heroTag= 'submit_button', MessageType type = MessageType.none,String message, String imageAssert})async{
    if(busy) return;
    busy = true;
    await AppNavigation.showMessage(context,title,heroTag: heroTag,type:type,message:message,imageAssert: imageAssert);    
    busy =false;
  }

  Future<bool> confirmMessage(String title,{ String message, String imageAssert})async {
    if(busy) return false;
    busy = true;
    var result = await AppNavigation.confirmMessage(context,title,message:message,imageAssert:imageAssert);
    busy =false;
    return result ?? false;
  }

  setLoading()async{
    if(busy) return;
    busy = true;
    var loadingWidget = Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: null,
        child: Container(
          width: 200.0,
          height: 150.0,
          child: /*Card (child: */
            
            SizedBox(
            width: 200.0,
            height: 150.0,
            child: CircularProgressIndicator()
            ),
          /*)*/
          )
      );
    // if(withBackground)
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_)=>loadingWidget
    );
    // else
    // await Navigator.of(context).push(PageRouteBuilder(opaque: false, pageBuilder:(_,__,___)=>loadingWidget));
    busy =false;
  }

  setResume(){
    if(!busy) return;
    busy =false;
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> hapticFeedback({bool heavy =true}){
    return AppNavigation.hapticFeedback(heavy: heavy);
    // await SystemChannels.platform.invokeMethod(
    //     'HapticFeedback.vibrate',
    //     heavy ? 'HapticFeedbackType.heavyImpact': 'HapticFeedbackType.selectionClick',
    //   );
  }

}
