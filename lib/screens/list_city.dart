import 'package:admin_dashboard/models/trajet.dart';
import 'package:admin_dashboard/screens/update_city.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListCity extends StatefulWidget {
  const ListCity({Key? key}) : super(key: key);

  @override
  State<ListCity> createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {

 // Nouvelle méthode pour afficher la fenêtre modale
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('trajet').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Une erreur s'est produite, veuillez réessayer");
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('Aucun trajet disponible');
            } else {
              return ListView(
                children: snapshot.data!.docs.map((e) {
                  var trajet = Trajet.fromJson(e.data() as Map<String, dynamic>);
                  return ListTile(
                  trailing: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmer la suppression'),
                            content: Text('Voulez-vous vraiment supprimer ce trajet ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                                child: Text('Annuler'),
                              ),
                              TextButton(
                                onPressed: () {
                                  e.reference.delete(); // Suppression de l'élément
                                  Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                },
                                child: Text('Supprimer',
                                style: TextStyle(color: Colors.red),),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                  title: Text('Ville de départ : ${trajet.cityDeparture}'),
                  subtitle: Text(
                    "Ville d'arrivée : ${trajet.cityArrival}\nPrix : ${trajet.price}"
                  ),
                  onTap: () {
                    _showUpdateModal(e.id); // Afficher la fenêtre modale de mise à jour
                  },
                );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
