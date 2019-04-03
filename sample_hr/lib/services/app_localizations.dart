import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';

class AppLocale {
  AppLocale(this.locale);

  final Locale locale;
  static AppLocale instance;

  static AppLocale of(BuildContext context) {
    
    if(instance != null) return instance; 
    if (context == null) {
      return new AppLocale(null);
    }
    var result = Localizations.of<AppLocale>(context, AppLocale);
    if(result != null) instance = result;
    return result;
  }

  Map<String, dynamic> _sentences;

  Future<bool> load() async {

    // TODO: load the _sentences from API

    //from file
    //String data = await rootBundle.loadString('resources/lang/${this.locale.languageCode}.json');
    //from databse


    // print('================== Start Loading the language');
    // Firestore.instance.document('languages/${this.locale.languageCode}/translation/default').snapshots().listen((onData){
    //   this._sentences = onData.data;  
    // });
    if(this.locale.languageCode == 'ar')
    _sentences = {
      'Home Page' : 'الشاشة الرئيسية',
      'Total Number of Departments:' : 'اجمالي عدد الادارات:'
    };

    //var language = await Firestore.instance.document('languages/ar').get();
    //print('================== got some data');
    //print(language.data);
    //print(language.data['Driver']);
    //this._sentences = language.data;
    return true;

    // var language = await Firestore.instance.document('languages/default').get();
    // String data = language.data[this.locale.languageCode].toString();

    // this._sentences = json.decode(data);
    // return true;
  }

  static String translate(BuildContext context,String key){
    if(context == null || key == null) return key ?? '[NULL]';
    var cls = of(context);
    if(cls == null)return key ?? '[NULL]';
    return cls.trans(key) ?? key;
  }

  String trans(String key) {
    if (key == null) return '';
    if (this._sentences == null) return key; // return the same key if the _sentences is null
    return this._sentences.containsKey(key) ? this._sentences[key] : key;    
  }
}
