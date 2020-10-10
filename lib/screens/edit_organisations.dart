import 'package:flutter/material.dart';
import 'package:two_wish_admin/components/drawer.dart';
import 'package:two_wish_admin/models/organisation.dart';
import 'package:two_wish_admin/services/database.dart';

import 'add_organisations.dart';

class EditOrganisation extends StatefulWidget {
  final Organisation organisation;
  final int index;
  EditOrganisation({this.organisation, this.index});

  @override
  _EditOrganisationState createState() => _EditOrganisationState();
}

class _EditOrganisationState extends State<EditOrganisation> {
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
  void initState() {
    nameController.text = widget.organisation.name;
    locationController.text = widget.organisation.location;
    descriptionController.text = widget.organisation.description;
    imageController.text = widget.organisation.imgURL;
    for (int x = 0; x < widget.organisation.items.length; x++) {
      itemsList.add(
        ItemWidget(
          index: x,
          function: () {
            setState(() {
              itemsList[x] = Container();
            });
          },
          itemName: widget.organisation.items[x]['Item'],
          itemImage: widget.organisation.items[x]['Image URL'],
          itemReceived: widget.organisation.items[x]['Amount received'],
          itemRequested: widget.organisation.items[x]['Requested Amount'],
          popular: widget.organisation.items[x]['Popular item'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Edit Organisation"),
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
                      print(itemsList);
                      setState(() {
                        int itemListLength = itemsList.length;
                        itemsList.add(
                          ItemWidget(
                            index: itemListLength,
                            itemRequested: null,
                            itemReceived: null,
                            function: () {
                              setState(() {
                                itemsList[itemListLength] = Container();
                              });
                            },
                          ),
                        );
                        print(itemsList);
                      });
                    },
                    child: Text("Add item"),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      for (dynamic index in itemsList) {
                        if (index != Container()) {
                          map.add({
                            'Item': index.itemNameController.text,
                            'Image URL': index.itemImageController.text,
                            'Requested Amount':
                                int.parse(index.itemRequestedController.text),
                            'Amount received':
                                int.parse(index.itemReceivedController.text),
                            'Popular item': index.isSwitched
                          });
                        }
                      }
                      DatabaseService databaseService = DatabaseService();
                      try {
                        databaseService.addOrganisationData(
                          documentID: widget.organisation.documentID,
                          name: nameController.text,
                          location: locationController.text,
                          description: descriptionController.text,
                          imageURL: imageController.text,
                          items: map,
                        );
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Submission Successful'),
                          ),
                        );
                        Navigator.pop(context);
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
                          "UPDATE",
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
