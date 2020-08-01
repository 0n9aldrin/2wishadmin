import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';
import 'package:two_wish_admin/components/organisation_card.dart';
import 'package:two_wish_admin/models/organisation.dart';
import 'package:two_wish_admin/services/database.dart';

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
        body: Container(
          child: StreamBuilder<List<Organisation>>(
            stream: DatabaseService().organisations,
            builder: (context, snapshot) {
              List<Organisation> organisationList = snapshot.data;
              if (!snapshot.hasData) {
                return Text("Loading...");
              } else {
                organisationList = List.from(organisationList.reversed);
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  padding: EdgeInsets.all(10),
                  itemCount: organisationList.length,
                  itemBuilder: (context, index) {
                    return OrganisationCard(
                        organisationList: organisationList, index: index);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
