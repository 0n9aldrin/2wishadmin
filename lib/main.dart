import 'package:flutter/material.dart';
import 'package:two_wish_admin/services/database.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DatabaseService().updateRequestsData(
              phoneNumber: '+6281284538316',
              itemId: '000069',
              donationAmount: 15,
              note: 'myController.text');
        },
      ),
    );
  }
}
