import 'package:flutter/material.dart';
import 'package:two_wish_admin/screens/home_page.dart';
import 'package:two_wish_admin/screens/update_organisations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/updateOrganisation': (context) => UpdateOrganisation(),
        '/requests': (context) => UpdateOrganisation(),
      },
    );
  }
}
