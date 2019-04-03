import 'package:flutter/material.dart';
import 'package:sample_hr/services/app_localizations_delegate.dart';
import 'package:sample_hr/services/theme.service.dart';
import 'package:sample_hr/views/pages/department_list.page.dart';
import 'package:sample_hr/views/pages/employee_list.page.dart';
import 'package:sample_hr/views/pages/home.page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeService.getMainTheme(),
      home: HomePage(),
      supportedLocales: [const Locale('ar', 'SA'), const Locale('en', 'US')],
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      //locale: Locale('ar', 'SA'),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
            // TODO: check the current locale and return one of them
            return supportedLocales.last;
            return locale;
          },
    );
  }
}
