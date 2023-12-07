 

// import 'package:admin_dashboard/models/trajet.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TrajetController {
//   CollectionReference trajectCollection =
//       FirebaseFirestore.instance.collection('trajet');

//   Future<void> inserTraject(
//       cityArrival, cityDeparture, price, List<String> timeDeparture) async {
//     Trajet trajet = Trajet(
//         cityArrival: cityArrival,
//         cityDeparture: cityDeparture,
//         isActive: true,
//         price: price,
//         timeDeparture: timeDeparture);

//     try {
//       await trajectCollection.add(trajet.toJson());
//       print("inserted");
//     } catch (e) {
//       print("erreur $e");
//       // Vous pouvez choisir de propager l'erreur ici ou de gérer différemment
//       throw e; // Propager l'erreur pour la capturer depuis l'appelant
//     }
//   }
// Future<void> deleteTrajet(String trajetId) async {
//     try {
//       await trajectCollection.doc(trajetId).delete();
//     } catch (e) {
//       throw Exception("Error deleting trajet: $e");
//     }
//   }
  
//   // Autres méthodes de votre contrôleur
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_dashboard/models/trajet.dart';

class TrajetController {
  CollectionReference trajetCollection =
      FirebaseFirestore.instance.collection('trajet');

  Future<void> inserTraject(String cityArrival, String cityDeparture, int price, List<String> timeDeparture) async {
    Trajet trajet = Trajet(
      cityArrival: cityArrival,
      cityDeparture: cityDeparture,
      isActive: true,
      price: price,
      timeDeparture: timeDeparture,
    );

    await trajetCollection.add(trajet.toJson());
  }
}

 