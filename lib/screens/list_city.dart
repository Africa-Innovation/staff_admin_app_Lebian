


import 'package:admin_dashboard/models/trajet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/controllers/trajet_controller.dart';
import 'package:admin_dashboard/controllers/ville_controller.dart';

class CreateTrajetScreen extends StatefulWidget {
  const CreateTrajetScreen({Key? key}) : super(key: key);

  @override
  _CreateTrajetScreenState createState() => _CreateTrajetScreenState();
}

class _CreateTrajetScreenState extends State<CreateTrajetScreen> {
  final TrajetController trajetController = TrajetController();
  final VilleController villeController = VilleController();
  final TextEditingController _heurController = TextEditingController();
  String? selectedCityDepartureId;
  String? selectedcityArrival;
  bool isLoading = false;
  List<String> heuresList = [];
  final TextEditingController _priceController = TextEditingController();

  List<DropdownMenuItem<String>>? villeDropdownItems;
  List<DropdownMenuItem<String>>? arrivalCityDropdownItems;

  @override
  void initState() {
    super.initState();
    fetchVilles();
  }

  Future<void> fetchVilles() async {
    List<DocumentSnapshot> villes = await villeController.getAllVilles();

    setState(() {
      villeDropdownItems = villes.map((DocumentSnapshot ville) {
        String id = ville.id;
        String nom = ville['nom'];

        return DropdownMenuItem<String>(
          value: id,
          child: Text(nom),
        );
      }).toList();
    });
  }

  void updateArrivalCityDropdown(String departureCityId) {
    setState(() {
      arrivalCityDropdownItems = villeDropdownItems
          ?.where((item) => item.value != departureCityId)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un trajet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCityDepartureId,
              onChanged: (newValue) {
                setState(() {
                  selectedCityDepartureId = newValue;
                  updateArrivalCityDropdown(newValue!);
                  selectedcityArrival = null;
                });
              },
              items: villeDropdownItems,
              decoration: InputDecoration(labelText: 'Ville de départ'),
            ),
            DropdownButtonFormField<String>(
              value: selectedcityArrival,
              onChanged: (newValue) {
                setState(() {
                  selectedcityArrival = newValue;
                });
              },
              items: arrivalCityDropdownItems ?? [],
              decoration: InputDecoration(labelText: 'Ville d\'arrivée'),
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
                  child: Text('Ajouter'),
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
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prix trajet',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (selectedCityDepartureId == null ||
                    selectedcityArrival == null ||
                    _priceController.text.isEmpty ||
                    heuresList.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Champs vides'),
                        content: Text(
                          'Veuillez remplir tous les champs avant d\'enregistrer.',
                        ),
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
                      selectedcityArrival!,
                      selectedCityDepartureId!,
                      int.parse(_priceController.text),
                      heuresList,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Trajet créé avec succès')),
                    );

                    setState(() {
                      selectedCityDepartureId = null;
                      selectedcityArrival = null;
                      _priceController.text = '';
                      _heurController.clear();
                      heuresList.clear();
                      isLoading = false;
                    });
                  } catch (e) {
                    print("Erreur lors de l'insertion du trajet : $e");
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
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

            SizedBox(height: 20),
            Text(
              'Trajets Enregistrés',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('trajet').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> trajets = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: trajets.length,
                    itemBuilder: (context, index) {
                      final trajetData = trajets[index].data() as Map<String, dynamic>;
                      final trajet = Trajet.fromJson(trajetData);

                      return ListTile(
                        title: Text('Trajet de ${trajet.cityDeparture} à ${trajet.cityArrival}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Prix: ${trajet.price}'),
                            Text('Heures de départ: ${trajet.timeDeparture.join(", ")}'),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

