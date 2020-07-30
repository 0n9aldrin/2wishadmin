import 'package:flutter/material.dart';
import 'package:two_wish_admin/models/request.dart';
import 'package:two_wish_admin/services/database.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Requests")),
        body: Container(
          child: StreamBuilder<List<Request>>(
            stream: DatabaseService().requests,
            builder: (context, snapshot) {
              List<Request> requestList = snapshot.data;
              return !snapshot.hasData
                  ? Text("Loading...")
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      padding: EdgeInsets.all(10),
                      itemCount: requestList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("Item ID: "),
                                      Text(requestList[index].itemId)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text("Donation Amount: "),
                                      Text(requestList[index]
                                          .donationAmount
                                          .toString())
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text("Phone Number: "),
                                      Text(requestList[index].phoneNumber)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text("Notes: "),
                                      Text(requestList[index].notes)
                                    ],
                                  ),
                                ],
                              )),
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
