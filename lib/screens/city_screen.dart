import 'package:admin_dashboard/models/trajet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/trajet_controller.dart';

class ManageCity extends StatefulWidget {
  const ManageCity({Key? key}) : super(key: key);

  @override
  State<ManageCity> createState() => _ManageCityState();
}

class _ManageCityState extends State<ManageCity> {
  final TextEditingController _depController = TextEditingController();
  final TextEditingController _arrController = TextEditingController();
  final TextEditingController _heurController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool isLoading = false; // État du chargement
  @override
  Widget build(BuildContext context) {
    TrajetController trajet = TrajetController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
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
              controller: _heurController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'heure departure'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Price trajet'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  if (_arrController.text.isEmpty ||
                      _depController.text.isEmpty ||
                      _priceController.text.isEmpty ||
                      _heurController.text.isEmpty) {
                    // Afficher une alerte ou un message indiquant de remplir tous les champs
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
                    // Tous les champs sont remplis, on peut effectuer l'enregistrement
                    setState(() {
                      isLoading = true; // Démarre l'indicateur de chargement
                    });

                    try {
                      await trajet.inserTraject(
                        _arrController.text,
                        _depController.text,
                        int.parse(_priceController.text),
                        _heurController.text,
                      );

                      // Si l'opération réussit, mettre fin au chargement
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      // En cas d'erreur, arrêtez le chargement et affichez l'erreur
                      setState(() {
                        isLoading = false;
                      });
                      print("Erreur lors de l'insertion du trajet : $e");
                      // Vous pouvez afficher un message d'erreur ici pour informer l'utilisateur
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
            ),
          ],
        ),
      ),
    );
  }
}
