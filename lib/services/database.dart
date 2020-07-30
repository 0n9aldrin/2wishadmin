import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      Firestore.instance.collection('requests');
  final CollectionReference organisationCollection =
      Firestore.instance.collection('organisations');
  Future<void> updateRequestsData(
      {String phoneNumber,
      String itemId,
      int donationAmount,
      String note}) async {
    return await requestsCollection.document('123').setData({
      'Phone Number': phoneNumber,
      'Item ID': itemId,
      'Donation amount': donationAmount,
      'Notes': note,
    });
  }

  Future<void> addOrganisationData(
      {String name,
      String organisationId,
      String location,
      String description,
      List<Map<String, dynamic>> items}) async {
    return await organisationCollection.document().setData({
      'Name': name,
      'Organisation ID': organisationId,
      'Location': location,
      'Description': description,
      'Items': items
    });
  }

}
