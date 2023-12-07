import 'package:cloud_firestore/cloud_firestore.dart';

class VilleController {
  CollectionReference villesCollection =
      FirebaseFirestore.instance.collection('villes');

  Future<List<DocumentSnapshot>> getAllVilles() async {
    QuerySnapshot querySnapshot = await villesCollection.get();
    return querySnapshot.docs;
  }
}
