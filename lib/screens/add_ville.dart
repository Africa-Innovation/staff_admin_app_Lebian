// import 'package:flutter/material.dart';

// class ManageNotification extends StatefulWidget {
//   const ManageNotification({super.key});

//   @override
//   State<ManageNotification> createState() => _ManageNotificationState();
// }

// class _ManageNotificationState extends State<ManageNotification> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               //controller: _phoneNumberController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(hintText: 'add a city'),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.width * 0.01,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 "valider",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 19,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                   primary: Colors.deepPurple.shade900,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   )),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height*0.1,),
//             DataTable(
//   headingRowColor: MaterialStateProperty.resolveWith(
//     (states) => Colors.grey.shade200),
//   columns: const [
//     DataColumn(label: Text("Ville")),
//     // DataColumn(label: Text("Heure de départ")),
//     // DataColumn(label: Text("Type de ticket")),
//     // DataColumn(label: Text("Date de réservation")),
//   ],
//   rows: [
//     DataRow(cells: [
//       DataCell(Text('koudougou')),
//       // DataCell(Text('10:00')),
//       // DataCell(Text('Type A')),
//       // DataCell(Text('2023-12-04')),
//     ]),
  
//     // DataRow(cells: [
//     //   DataCell(Text('name')),
//     //   DataCell(Text('08:30')),
//     //   DataCell(Text('Type B')),
//     //   DataCell(Text('2023-12-05')),
//     // ]),
//   ],
// ),

                          
//           ],
//         ),
//       ),
//     );
//   }
// }

 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddCityScreen(),
    );
  }
}

class AddCityScreen extends StatefulWidget {
  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _nomController = TextEditingController();
  bool _isAdding = false;

  void _ajouterVille() {
    setState(() {
      _isAdding = true;
    });

    String nomVille = _nomController.text;

    if (nomVille.isNotEmpty) {
      FirebaseFirestore.instance.collection('villes').add({
        'nom': nomVille,
      }).then((_) {
        // Données insérées avec succès
        print('Ville ajoutée avec succès');
        // Vous pouvez ajouter ici des actions après l'insertion des données

        setState(() {
          _isAdding = false;
        });
      }).catchError((error) {
        // En cas d'erreur lors de l'ajout des données
        print('Erreur lors de l\'ajout de la ville : $error');
        setState(() {
          _isAdding = false;
        });
      });
    } else {
      // Gérer le cas où le champ est vide
      print('Veuillez saisir le nom de la ville');
      setState(() {
        _isAdding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une ville'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nomController,
              decoration: InputDecoration(
                labelText: 'Nom de la ville',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            _isAdding
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _ajouterVille,
                    child: Text('Ajouter la ville'),
                  ),
          ],
        ),
      ),
    );
  }
}
