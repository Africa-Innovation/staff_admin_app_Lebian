import 'package:cloud_firestore/cloud_firestore.dart';

class VilleController {
  CollectionReference villesCollection =
      FirebaseFirestore.instance.collection('villes');

  Future<List<DocumentSnapshot>> getAllVilles() async {
    QuerySnapshot querySnapshot = await villesCollection.get();
    return querySnapshot.docs;
  }

   Future<DocumentSnapshot> getVilleById(String villeId) async {
    try {
      DocumentSnapshot villeSnapshot = await villesCollection.doc(villeId).get();
      return villeSnapshot;
    } catch (e) {
      throw Exception("Erreur lors de la récupération de la ville: $e");
    }
  }
}
