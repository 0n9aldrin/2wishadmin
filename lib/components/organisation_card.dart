import 'package:flutter/material.dart';
import 'package:two_wish_admin/const.dart';
import 'package:two_wish_admin/models/organisation.dart';
import 'package:two_wish_admin/screens/add_organisations.dart';

class OrganisationCard extends StatelessWidget {
  final List<Organisation> organisationList;
  final int index;

  OrganisationCard({this.organisationList, this.index});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddOrganisation()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          child: Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Name: ", style: whiteFontStyle),
                      Text(organisationList[index].name, style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Location: ", style: whiteFontStyle),
                      Text(organisationList[index].location,
                          style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Item count: ", style: whiteFontStyle),
                      Text(organisationList[index].items.length.toString(),
                          style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Description: ", style: whiteFontStyle),
                    ],
                  ),
                  Text(organisationList[index].description,
                      style: whiteFontStyle)
                ],
              )),
        ),
      ),
    );
  }
}
