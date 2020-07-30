import 'dart:io';

import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';
import 'package:two_wish_admin/services/database.dart';

class UpdateOrganisation extends StatefulWidget {
  @override
  _UpdateOrganisationState createState() => _UpdateOrganisationState();
}

class _UpdateOrganisationState extends State<UpdateOrganisation> {
  List<Widget> itemsList = [];
  List<Map<String, dynamic>> map = [];

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(
          context: context,
        ),
        appBar: AppBar(
          title: Text("Update Organisation"),
        ),
        body: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Image URL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Items",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: itemsList,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        int itemListLength = itemsList.length;
                        itemsList.add(
                          ItemWidget(
                            index: itemListLength,
                            function: () {
                              setState(() {
                                itemsList[itemListLength] = Container();
                              });
                            },
                          ),
                        );
                      });
                    },
                    child: Text("Add item"),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      for (dynamic index in itemsList) {
                        if (index != Container()) {
                          map.add({
                            'Item': index.itemNameController.text,
                            'Image URL': index.itemImageController.text,
                            'Requested Amount':
                                index.itemRequestedController.text,
                            'Amount received': index.itemReceivedController.text
                          });
                        }
                      }
                      try {
                        DatabaseService().addOrganisationData(
                          name: nameController.text,
                          organisationId: '2',
                          location: locationController.text,
                          description: descriptionController.text,
                          items: map,
                        );
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Submission Successful'),
                          ),
                        );
                        nameController.clear();
                        locationController.clear();
                        descriptionController.clear();
                        imageController.clear();
                        itemsList.clear();
                        map.clear();
                        setState(() {});
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                        ));
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "DONE",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Function function;
  final int index;
  ItemWidget({this.function, this.index});

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemImageController = TextEditingController();
  final TextEditingController itemRequestedController = TextEditingController();
  final TextEditingController itemReceivedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: itemNameController,
                  decoration: InputDecoration(
                    hintText: "Name of item",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: itemImageController,
                  decoration: InputDecoration(
                    hintText: "Image URL",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: itemRequestedController,
                  decoration: InputDecoration(
                    hintText: "Requested Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: itemReceivedController,
                  decoration: InputDecoration(
                    hintText: "Amount received",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                RaisedButton(
                  onPressed: function,
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Text(
                        "Delete item",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}