// import 'package:admin_dashboard/models/trajet.dart';
// import 'package:admin_dashboard/screens/update_city.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ListCity extends StatefulWidget {
//   const ListCity({Key? key}) : super(key: key);

//   @override
//   State<ListCity> createState() => _ListCityState();
// }

// class _ListCityState extends State<ListCity> {

//  // Nouvelle méthode pour afficher la fenêtre modale
//   void _showUpdateModal(String id) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Mise à jour du trajet'),
//           content: SingleChildScrollView(
//             child: UpdateCity(id: id),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('trajet').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text("Une erreur s'est produite, veuillez réessayer");
//             } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Text('Aucun trajet disponible');
//             } else {
//               return ListView(
//                 children: snapshot.data!.docs.map((e) {
//                   var trajet = Trajet.fromJson(e.data() as Map<String, dynamic>);
//                   return ListTile(
//                   trailing: GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text('Confirmer la suppression'),
//                             content: Text('Voulez-vous vraiment supprimer ce trajet ?'),
//                             actions: <Widget>[
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop(); // Fermer la boîte de dialogue
//                                 },
//                                 child: Text('Annuler'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   e.reference.delete(); // Suppression de l'élément
//                                   Navigator.of(context).pop(); // Fermer la boîte de dialogue
//                                 },
//                                 child: Text('Supprimer',
//                                 style: TextStyle(color: Colors.red),),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Icon(Icons.delete,color: Colors.red,),
//                   ),
//                   title: Text('Ville de départ : ${trajet.cityDeparture}'),
//                   subtitle: Text(
//                     "Ville d'arrivée : ${trajet.cityArrival}\nPrix : ${trajet.price}"
//                   ),
//                   onTap: () {
//                     _showUpdateModal(e.id); // Afficher la fenêtre modale de mise à jour
//                   },
//                 );
//                 }).toList(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:admin_dashboard/models/trajet.dart';
// import '../controllers/trajet_controller.dart';
// import 'update_city.dart'; // Assurez-vous d'utiliser le bon chemin pour le fichier UpdateCity

// class ListCity extends StatefulWidget {
//   const ListCity({Key? key}) : super(key: key);

//   @override
//   State<ListCity> createState() => _ListCityState();
// }

// class _ListCityState extends State<ListCity> {
//   final TextEditingController _depController = TextEditingController();
//   final TextEditingController _arrController = TextEditingController();
//   final TextEditingController _heurController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   bool isLoading = false; // État du chargement
//   TrajetController trajetController = TrajetController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
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

//             ElevatedButton(
//               onPressed: () async {
//                 if (_arrController.text.isEmpty ||
//                     _depController.text.isEmpty ||
//                     _priceController.text.isEmpty ||
//                     _heurController.text.isEmpty) {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Champs vides'),
//                         content: Text('Veuillez remplir tous les champs avant d\'enregistrer.'),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   setState(() {
//                     isLoading = true;
//                   });

//                   try {
//                     await trajetController.inserTraject(
//                       _arrController.text,
//                       _depController.text,
//                       int.parse(_priceController.text),
//                       _heurController.text,
//                     );

//                     setState(() {
//                       isLoading = false;
//                     });
//                   } catch (e) {
//                     setState(() {
//                       isLoading = false;
//                     });
//                     print("Erreur lors de l'insertion du trajet : $e");
//                   }
//                 }
//               },
//               child: isLoading
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             "En cours ...",
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         CircularProgressIndicator(color: Colors.white),
//                       ],
//                     )
//                   : Text("Valider"),
//             ),

//             const SizedBox(height: 20),

//             Text(
//               'Liste des trajets',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),

//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('trajet').snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text("Une erreur s'est produite, veuillez réessayer"));
//                   } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Center(child: Text('Aucun trajet disponible'));
//                   } else {
//                     return ListView(
//                       children: snapshot.data!.docs.map((e) {
//                         var trajet = Trajet.fromJson(e.data() as Map<String, dynamic>);
//                         return ListTile(
//                           title: Text('Ville de départ : ${trajet.cityDeparture}'),
//                           subtitle: Text("Ville d'arrivée : ${trajet.cityArrival}\nPrix : ${trajet.price}"),
//                           trailing: Row(
//                              mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () {
//                                   _showUpdateModal(e.id);
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () {
//                                  _confirmDeleteDialog(e.id);
//                                 },
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showUpdateModal(String id) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Mise à jour du trajet'),
//           content: SingleChildScrollView(
//             child: UpdateCity(id: id),
//           ),
//         );
//       },
//     );
//   }
// void _deleteTrajet(String trajetId) async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       await trajetController.deleteTrajet(trajetId);
//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print("Erreur lors de la suppression du trajet : $e");
//     }
//   }

//   Future<void> _confirmDeleteDialog(String trajetId) async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirmation'),
//           content: Text('Voulez-vous vraiment supprimer ce trajet ?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text('Annuler'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _deleteTrajet(trajetId);
//                 Navigator.of(context).pop(true);
//               },
//               child: Text('Supprimer'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_dashboard/models/trajet.dart';
import '../controllers/trajet_controller.dart';
import 'update_city.dart'; // Assurez-vous d'utiliser le bon chemin pour le fichier UpdateCity

class ListCity extends StatefulWidget {
  const ListCity({Key? key}) : super(key: key);

  @override
  State<ListCity> createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  final TextEditingController _depController = TextEditingController();
  final TextEditingController _arrController = TextEditingController();
  final TextEditingController _heurController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ajouterHeureController = TextEditingController();
  bool isLoading = false; // État du chargement
  TrajetController trajetController = TrajetController();
  List<String> heuresList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Wrap(
              children: [
                TextField(
                  controller: _heurController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Ajouter heure de départ'),
                  onSubmitted: (value) {
                    setState(() {
                      heuresList.add(value);
                      _heurController.clear();
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_heurController.text.isNotEmpty) {
                        heuresList.add(_heurController.text);
                        _heurController.clear();
                      }
                    });
                  },
                  child: Text('Ajouter'), ////////////////////
                ),
              ],
            ),
            Wrap(
              children: heuresList.map((heure) {
                return Chip(
                  label: Text(heure),
                  onDeleted: () {
                    setState(() {
                      heuresList.remove(heure);
                    });
                  },
                );
              }).toList(),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Price trajet'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_arrController.text.isEmpty ||
                    _depController.text.isEmpty ||
                    _priceController.text.isEmpty ||
                    heuresList.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Champs vides'),
                        content: Text(
                            'Veuillez remplir tous les champs avant d\'enregistrer.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await trajetController.inserTraject(
                      _arrController.text,
                      _depController.text,
                      int.parse(_priceController.text),
                      heuresList,
                    );

                    setState(() {
                      isLoading = false;
                    });
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    print("Erreur lors de l'insertion du trajet : $e");
                  }
                }
              },
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "En cours ...",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        CircularProgressIndicator(color: Colors.white),
                      ],
                    )
                  : Text("Valider"),
            ),
            const SizedBox(height: 20),
            Text(
              'Liste des trajets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('trajet').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            "Une erreur s'est produite, veuillez réessayer"));
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('Aucun trajet disponible'));
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map((e) {
                        var trajet =
                            Trajet.fromJson(e.data() as Map<String, dynamic>);
                        return ListTile(
                          title:
                              Text('Ville de départ : ${trajet.cityDeparture}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ville d'arrivée : ${trajet.cityArrival}"),
                              Text("Prix : ${trajet.price}"),
                              Row(
                                children: [
                                  Text("Heures de départ :"),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Ajouter l\'heure'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  TextField(
                                                    controller:
                                                        _ajouterHeureController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Ajouter une heure"),
                                                    onChanged: (value) {},
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Annuler'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'trajet')
                                                              .doc(e.id)
                                                              .update({
                                                            'time_departure':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _ajouterHeureController
                                                                  .text
                                                            ]),
                                                          });
                                                          print("inserted");
                                                          _ajouterHeureController
                                                              .clear();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Ajouter'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.add))
                                ],
                              ), ////////////////////////////////////////////////////////////////
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: trajet.timeDeparture
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  String heure = entry.value;
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Text(heure),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              String newHour = trajet
                                                      .timeDeparture[
                                                  index]; // Valeur initiale de l'heure

                                              return AlertDialog(
                                                title:
                                                    Text('Modifier l\'heure'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextField(
                                                      controller:
                                                          TextEditingController(
                                                              text: newHour),
                                                      onChanged: (value) {
                                                        newHour =
                                                            value; // Mettre à jour la nouvelle valeur de l'heure
                                                      },
                                                    ),
                                                    SizedBox(height: 20),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              Text('Annuler'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              trajet.timeDeparture[
                                                                      index] =
                                                                  newHour; // Mettre à jour l'heure avec la nouvelle valeur saisie
                                                              // Mettre à jour la liste dans Firestore après la modification
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'trajet')
                                                                  .doc(e.id)
                                                                  .update({
                                                                'time_departure':
                                                                    trajet
                                                                        .timeDeparture,
                                                              });
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              Text('Modifier'),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Supprimer cette heure ?'),
                                                content: Text(
                                                    'Êtes-vous sûr de vouloir supprimer cette heure ?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trajet.timeDeparture
                                                            .removeAt(index);
                                                        // Mettre à jour la liste dans Firestore après la suppression
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'trajet')
                                                            .doc(e.id)
                                                            .update({
                                                          'time_departure':
                                                              trajet
                                                                  .timeDeparture,
                                                        });
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Supprimer'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Annuler'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _showUpdateModal(e.id);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _confirmDeleteDialog(e.id);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateModal(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mise à jour du trajet'),
          content: SingleChildScrollView(
            child: UpdateCity(id: id),
          ),
        );
      },
    );
  }

  void _deleteTrajet(String trajetId) async {
    setState(() {
      isLoading = true;
    });

    try {
      await trajetController.deleteTrajet(trajetId);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Erreur lors de la suppression du trajet : $e");
    }
  }

  Future<void> _confirmDeleteDialog(String trajetId) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment supprimer ce trajet ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _deleteTrajet(trajetId);
                Navigator.of(context).pop(true);
              },
              child: Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }
}
