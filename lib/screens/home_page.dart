import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';
import 'package:two_wish_admin/services/database.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(context: context),
      appBar: AppBar(
        title: Text("Admin"),
      ),
    );
  }
}
