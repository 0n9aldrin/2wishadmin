import 'package:flutter/material.dart';
import 'package:two_wish_admin/const.dart';
import 'package:two_wish_admin/models/request.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestCard extends StatelessWidget {
  final List<Request> requestList;
  final int index;

  RequestCard({this.requestList, this.index});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () async {
          final Uri _phoneLaunchUri = Uri(
            scheme: 'tel',
            path: requestList[index].phoneNumber,
          );
          if (await canLaunch(_phoneLaunchUri.toString())) {
            await launch(_phoneLaunchUri.toString());
          } else {
            throw 'Could not launch ${_phoneLaunchUri.toString()}';
          }
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
                      Text("Item ID: ", style: whiteFontStyle),
                      Text(requestList[index].itemId, style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Donation Amount: ", style: whiteFontStyle),
                      Text(requestList[index].donationAmount.toString(),
                          style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Phone Number: ", style: whiteFontStyle),
                      Text(requestList[index].phoneNumber,
                          style: whiteFontStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Notes: ", style: whiteFontStyle),
                      Text(requestList[index].notes, style: whiteFontStyle)
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
