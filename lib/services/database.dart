import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      Firestore.instance.collection('requests');
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
}
