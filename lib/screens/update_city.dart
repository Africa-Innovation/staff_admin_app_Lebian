// import 'package:admin_dashboard/models/trajet.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../controllers/trajet_controller.dart';

// class UpdateCity extends StatefulWidget {
//   UpdateCity({Key? key, required this.id}) : super(key: key);
//   final String id;

//   @override
//   State<UpdateCity> createState() => _UpdateCityState();
// }

// class _UpdateCityState extends State<UpdateCity> {
//   final TextEditingController _depController = TextEditingController();
//   final TextEditingController _arrController = TextEditingController();
//   final TextEditingController _heurController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Fetch the current trajet data by ID and populate the text fields
//     FirebaseFirestore.instance.collection('trajet').doc(widget.id).get().then((doc) {
//       if (doc.exists) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         setState(() {
//           _depController.text = data['city_departure'] ?? '';
//           _arrController.text = data['city_arrival'] ?? '';
//           _heurController.text = data['time_departure'] ?? '';
//           _priceController.text = data['price'] ?? "0";
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//             title: Text("STAF"),
//             backgroundColor: Colors.deepPurple.shade400,
//           ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _depController,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(hintText: 'City Depart'),
//             ),
//             TextField(
//               controller: _arrController,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(hintText: 'City Destinations'),
//             ),
//             TextField(
//               controller: _heurController,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(hintText: 'heure departure'),
//             ),
//             TextField(
//               controller: _priceController,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(hintText: 'Price trajet'),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.width * 0.01,
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Update the trajet data in Firestore with the new values
//                 Trajet trajet = Trajet(cityArrival:  _arrController.text, cityDeparture:  _depController.text, isActive: true, price: int.parse(_priceController.text), timeDeparture:  _heurController.text);
//                 FirebaseFirestore.instance.collection('trajet').doc(widget.id).update(trajet.toJson()).then((_) {
//                   // If the update is successful, you can navigate back to the previous screen
//                   Navigator.of(context).pop();
//                 }).catchError((error) {
//                   // Handle errors here, e.g., show an error message
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('Failed to update data: $error'),
//                   ));
//                 });
//               },
//               child: Container(
//                 color: Colors.black,
//                 child: Text(
//                   "Valider",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 19,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:admin_dashboard/models/trajet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/trajet_controller.dart';

class UpdateCity extends StatefulWidget {
  final String id;

  const UpdateCity({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateCity> createState() => _UpdateCityModelState();
}

class _UpdateCityModelState extends State<UpdateCity> {
  final TextEditingController _depController = TextEditingController();
  final TextEditingController _arrController = TextEditingController();
  final TextEditingController _heurController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch the current trajet data by ID and populate the text fields
    FirebaseFirestore.instance
        .collection('trajet')
        .doc(widget.id)
        .get()
        .then((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        setState(() {
          _depController.text = data['city_departure'] ?? '';
          _arrController.text = data['city_arrival'] ?? '';
            _priceController.text = data['price'].toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _depController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'City Depart'),
        ),
        TextField(
          controller: _arrController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'City Destinations'),
        ),
      
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'Price trajet'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.01,
        ),
        ElevatedButton(
          onPressed: () {
            // Mettre à jour les données du trajet dans Firestore avec les nouvelles valeurs
            Trajet trajet = Trajet(
              cityArrival: _arrController.text,
              cityDeparture: _depController.text,
              isActive: true,
              price: int.parse(_priceController.text),
             );
            FirebaseFirestore.instance
                .collection('trajet')
                .doc(widget.id)
                .update(trajet.toJson())
                .then((_) {
              // Si la mise à jour réussit, fermez la fenêtre modale
              Navigator.of(context).pop();
            }).catchError((error) {
              // Gérer les erreurs ici, par exemple, afficher un message d'erreur
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Échec de la mise à jour des données : $error'),
              ));
            });
          },
          child: Text("Valider"),
        ),
      ],
    );
  }
}
