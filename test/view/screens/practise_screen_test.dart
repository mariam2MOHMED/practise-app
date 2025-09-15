import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practise/view/screens/practise_screen.dart';
import 'package:practise/view/screens/test_screen.dart';

void main() {
  testWidgets("test screen", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: TestScreen(),));
    expect(find.byType(AppBar), findsOneWidget);
  });
}
