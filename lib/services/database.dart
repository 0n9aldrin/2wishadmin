import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_wish_admin/models/organisation.dart';
import 'package:two_wish_admin/models/request.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      Firestore.instance.collection('requests');
  final CollectionReference organisationCollection =
      Firestore.instance.collection('organisations');
  final CollectionReference globalCollection =
      Firestore.instance.collection('global');

  Future<void> addOrganisationData(
      {String name,
      String documentID,
      String imageURL,
      String location,
      String description,
      List<Map<String, dynamic>> items}) async {
    return await organisationCollection.document(documentID).setData({
      'Name': name,
      'Location': location,
      'Description': description,
      'Images': imageURL,
      'Items': items
    });
  }

  Future<void> updateOrganisationData(
      {String name,
      String location,
      String imageURL,
      String description,
      List<Map<String, dynamic>> items}) async {
    return await organisationCollection.document().setData({
      'Name': name,
      'Location': location,
      'Description': description,
      'Items': items,
      'Images': imageURL,
    });
  }

  List<Organisation> organisationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Organisation(
          name: doc.data['Name'] ?? '',
          location: doc.data['Location'] ?? '',
          description: doc.data['Description'] ?? '',
          items: doc.data['Items'] ?? [],
          imgURL: doc.data['Images'] ?? '',
          documentID: doc.documentID ?? '');
    }).toList();
  }

  Stream<List<Organisation>> get organisations {
    return organisationCollection.snapshots().map(organisationListFromSnapshot);
  }

  List<Request> requestListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Request(
        donationAmount: doc.data['Donation amount'] ?? 0,
        itemId: doc.data['Item ID'] ?? '',
        notes: doc.data['Notes'] ?? '',
        phoneNumber: doc.data['Phone Number'] ?? '',
      );
    }).toList();
  }

  Stream<List<Request>> get requests {
    return requestsCollection.snapshots().map(requestListFromSnapshot);
  }

  Future<void> updateOrganisationLength({int requestNumber}) async {
    return await globalCollection
        .document('Number of Organisations')
        .setData({'number': requestNumber});
  }

  Future<int> getOrganisationLength() async {
    return await globalCollection
        .document("Number of Organisations")
        .get()
        .then((value) => value.data['number']);
  }

  Future<void> deleteOrganisation({String documentID}) async {
    return await organisationCollection.document(documentID).delete();
  }
}
