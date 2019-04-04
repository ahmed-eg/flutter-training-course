import 'dart:async';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_hr/helpers/message_type.dart';

class AppNavigation{
  

  static Future<dynamic> showAppDialog(context,creator,{AnimationTypes animationType = AnimationTypes.slideLeft}){
    return showDialog(context:context,builder: creator );
  }

  static Future<dynamic> navigateTo(context,creator, {bool replacment = false,bool replaceAll =false, AnimationTypes animationType = AnimationTypes.slideLeft}){
    
    dynamic route ;
    if(Theme.of(context).platform == TargetPlatform.iOS && animationType != AnimationTypes.none && animationType != AnimationTypes.opacity)
      route = CupertinoPageRoute(builder: (_)=> creator());
    else if(animationType == AnimationTypes.none)
      route = PageRouteBuilder(pageBuilder: (_,__,___)=> creator());
    else
      route = PageRouteBuilder(
       pageBuilder: (_,__,___)=> creator(),
              transitionDuration: Duration(milliseconds: 100),
              transitionsBuilder: getAnimation(animationType)
          );

    if(replaceAll){
      // remove all pages in navigation history
      while(Navigator.of(context).canPop())Navigator.of(context).pop();
      replacment =true;
      //return Navigator.of(context).pushAndRemoveUntil(route,(Route<dynamic> route) => route.isFirst);
    }

    if(replacment)
     return Navigator.of(context).pushReplacement(route);
    else
     return Navigator.of(context).push(route);

    

  }

  static Widget  animationSlideLeft(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      return SlideTransition(
        child: child,
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
      );
    }
  
  static Widget animationSlideRight(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      return SlideTransition(
        child: child,
        position: new Tween<Offset>(
          begin:const Offset(-1.0, 0.0),
          end:Offset.zero
        ).animate(animation),
      );
  }

  static Widget animationSlideUp(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      return SlideTransition(
        child: child,
        position: new Tween<Offset>(
          begin:const Offset(0.0, 1.0),
          end:Offset.zero
        ).animate(animation),
      );
  }

  static Widget animationOpacity(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
    return Opacity(
              opacity: animation.value,
              child: child,
            );
  }

  static Function(BuildContext, Animation<double>, Animation<double>, Widget) getAnimation(AnimationTypes type){
    switch(type){
      case AnimationTypes.none:
      return null;
      case AnimationTypes.opacity:
        return animationOpacity;
      case AnimationTypes.slideLeft:
        return animationSlideLeft;
      case AnimationTypes.slideRight:
        return animationSlideRight;
      case AnimationTypes.slideUp:
        return animationSlideUp;
      default:
        return null;
    }
  }


  
  static Future<dynamic> showMessage(BuildContext context,String title, {String heroTag= 'submit_button', MessageType type = MessageType.none,String message, String imageAssert})async{
   
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder:(_)=> Column(
      children: <Widget>[ 
        Expanded(child: Container()),
      Hero( tag:heroTag,
       child:Card(
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            color: Colors.white,
            child:Container( width: 300.0, child:
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30.0),
                getMessageImageWidget(type),
                SizedBox(height: 5.0),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child:Text(title, style: TextStyle(fontSize: 25.0, color: Colors.black), textAlign: TextAlign.center,)),
                 message != null ? SizedBox(height: 20.0) : Container(),
                message != null ? Padding(padding: EdgeInsets.symmetric(horizontal: 30.0), child: Text(message, style: TextStyle(fontSize: 18.0, color: Colors.black45), textAlign: TextAlign.center, softWrap: true, maxLines: 4)) : Container(),
                SizedBox(height: 40.0),
                 ButtonTheme(
                  minWidth: 120.0,
                  height: 60.0,
                  child:RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    color: Colors.white,
                    onPressed:()=>Navigator.of(_, rootNavigator: true).pop(),
                    child: Text('OK', style: TextStyle(color:Theme.of(context).primaryColor)),
                )),
                
                SizedBox(height: 50.0),
              ],
            )),
      )),
      Expanded(child: Container(),),
      ]
      ),
    );

  }

  static getMessageImageWidget(MessageType type){
   
    switch(type){
      case MessageType.none:
      return Container();
      case MessageType.warning:
      return Icon(Icons.error_outline, size: 90.0, color: Colors.yellow);
      case MessageType.error:
      //return SizedBox(width:180.0, height:180.0,child: 
          //FlareActor('assets/animations/status.flr', animation:'Error',  isPaused: false));
      return Icon(Icons.cancel, size: 90.0, color: Colors.red);
      case MessageType.info:
      return Icon(Icons.announcement, size: 90.0, color: Colors.black);
      default:
      return Image.asset('assets/images/logo.png', width:150.0, height: 90.0) ;
    }
  }

  static Future<bool> confirmMessage(BuildContext context,String title,{ String message, String imageAssert})async {
    
    var result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder:(_)=> Column(
      children: <Widget>[ 
        Expanded(child: Container()),
      Card(
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            color: Colors.white,
            child:Container( width: 300.0, child:
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60.0),
                imageAssert != null? Image.asset(imageAssert, width:150.0, height: 90.0,) : Container(),
                SizedBox(height: 25.0),
                Text(title, style: TextStyle(fontSize: 25.0, color: Colors.black), textAlign: TextAlign.center,),
                SizedBox(height: 20.0),
                message != null ? Padding(padding: EdgeInsets.symmetric(horizontal: 30.0), child: Text(message, style: TextStyle(fontSize: 18.0, color: Colors.black45), textAlign: TextAlign.center, softWrap: true, maxLines: 4)) : Container(),
                SizedBox(height: 40.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                ButtonTheme(
                  minWidth: 100.0,
                  height: 60.0,
                  child:RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  onPressed: ()=>Navigator.of(_).pop(true),
                  child: Text('Yes', style: TextStyle(color: Colors.white)
                  ),
                )),
                SizedBox(width: 15.0),
                 ButtonTheme(
                  minWidth: 100.0,
                  height: 60.0,
                  child:RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  color: Colors.white,
                  onPressed:()=>Navigator.of(_).pop(false),
                  child: Text('No', style: TextStyle(color: Theme.of(context).primaryColor)),
                ))
                ],),
                SizedBox(height: 50.0),
              ],
            )),
      ),
      Expanded(child: Container(),),
      ]
      ),
    );
    
    return result ?? false;
  }


  static Future<void> hapticFeedback({bool heavy =true}) async{
    await SystemChannels.platform.invokeMethod(
        'HapticFeedback.vibrate',
        heavy ? 'HapticFeedbackType.heavyImpact': 'HapticFeedbackType.selectionClick',
      );
  }
  

}

enum AnimationTypes{
  none,
  slideLeft,
  slideRight,
  slideUp,
  opacity
}

