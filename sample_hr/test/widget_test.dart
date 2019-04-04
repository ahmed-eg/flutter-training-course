// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sample_hr/main.dart';
import 'package:sample_hr/models/department.dart';
import 'package:sample_hr/models/employee.dart';
import 'package:sample_hr/views/pages/department_form.page.dart';
import 'package:sample_hr/views/pages/employee_form.page.dart';
import 'package:sample_hr/views/widgets/text_form_field.dart';

void main() {

  test('sample test',()async{
    var data = 100;
    expect(data, 100);
  });

  testWidgets('department test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp (home: DepartmentFormPage(Department(code:'100',nameAr: 'aaaa', nameEn: 'eeee'))));

    await tester.pump(Duration(seconds: 2));
    //var code= find.byKey(DepartmentFormPage.codeKey);
    //await tester.enterText(code, '200');
    
    
    // Verify that our counter has incremented.
    //expect(find.text('200'), findsOneWidget);
    print('done :)');
    //expect(find.text('100'), findsOneWidget);
    //expect(find.text('eeee'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });


}


// flutter test test/widget_test.dart