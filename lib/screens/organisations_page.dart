import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';

class OrganisationsPage extends StatefulWidget {
  @override
  _OrganisationsPageState createState() => _OrganisationsPageState();
}

class _OrganisationsPageState extends State<OrganisationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(context: context),
        appBar: AppBar(title: Text("Organisations")),
        body: Container(),
      ),
    );
  }
}
