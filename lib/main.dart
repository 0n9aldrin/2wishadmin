import 'package:flutter/material.dart';
import 'package:two_wish_admin/screens/home_page.dart';
import 'package:two_wish_admin/screens/organisations_page.dart';
import 'package:two_wish_admin/screens/requests_page.dart';
import 'package:two_wish_admin/screens/add_organisations.dart';

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
        '/addOrganisation': (context) => AddOrganisation(),
        '/requests': (context) => RequestsPage(),
        '/organisations': (context) => OrganisationsPage(),
      },
    );
  }
}
