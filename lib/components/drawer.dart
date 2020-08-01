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
            child: Text('Drawer Header'),
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
            title: Text('Update Organisation'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/updateOrganisation');
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
