import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';
import 'package:two_wish_admin/components/request_card.dart';
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
        drawer: DrawerWidget(
          context: context,
        ),
        appBar: AppBar(title: Text("Requests")),
        body: Container(
          child: StreamBuilder<List<Request>>(
            stream: DatabaseService().requests,
            builder: (context, snapshot) {
              List<Request> requestList = snapshot.data;
              if (!snapshot.hasData) {
                return Text("Loading...");
              } else {
                requestList = List.from(requestList.reversed);
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  padding: EdgeInsets.all(10),
                  itemCount: requestList.length,
                  itemBuilder: (context, index) {
                    return RequestCard(requestList: requestList, index: index);
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
