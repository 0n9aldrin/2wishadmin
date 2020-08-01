import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;
  DrawerWidget({this.context});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Admin'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Add Organisation'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/addOrganisation');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Requests'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/requests');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Organisations'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/organisations');
            },
          ),
        ],
      ),
    );
  }
}
