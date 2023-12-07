import 'dart:js_util';

import 'package:admin_dashboard/screens/pubbanner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routeName = '\UploadBannerScreen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image; // la variable qui vas stocker nos images

  String? fileName; // cette variable vas stocke le nom des images choisis

  //  List<String> imageUrls = []; // Stocke les URL des images depuis Firestore
  bool isLoading = false;
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadBannersToStorage(dynamic image) async {
    // on utilise async lorsquon prevoit dutiliser await
    Reference ref = _storage.ref().child('Banner').child(
        fileName!); // ici on creer un fichier Banner qui vas prendre le nom des images
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot =
        await uploadTask; //awit veut dire que ca va prendre du temps, il faut attendre

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadToFireStore() async {
    //EasyLoading.show(); // le chargement commence ici
    if (_image != null) {
      String imageUrl = await _uploadBannersToStorage(_image);

      await _firestore.collection('banners').doc(fileName).set({
        'image': imageUrl,
      }).whenComplete(() {
        // EasyLoading
        //  .dismiss(); // le chargement se termine une fois linstruction effectue

        setState(() {
          _image =
              null; // pour dire que une fois que l'image est enregistré,il faut faire disparaitre l'image de la zone daffichage
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // permet de scroller
      child: Column(
        children: [
          Container(
            alignment: Alignment
                .topLeft, // topleft permet denvoyer le texte vers la gauche
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banners',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(color: Colors.grey.shade900),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _image != null
                          ? // si image nest pas null .....
                          Image.memory(
                              _image,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Center(
                                  child: Text('Failed to load image'),
                                );
                              },
                            )
                          : // ....alors on sauvegare et on affiche l'image, si non on affiche un texte qui sera centre
                          Center(
                              child: Text('Banner'),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow.shade900,
                      ),
                      onPressed: () {
                        pickImage();
                      },
                      child: Text('Upload Image'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade900,
                    ),
                    onPressed: () async {
                      if (_image == null) {
                        // Afficher un dialogue d'erreur
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erreur'),
                              content: Text('Veuillez sélectionner une image.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Fermer le dialogue
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // L'image est sélectionnée, procédez à l'envoi vers Firestore
                        setState(() {
                          isLoading = true;
                        });

                        await uploadToFireStore();

                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "En cours ...",
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 2),
                              CircularProgressIndicator(color: Colors.white),
                            ],
                          )
                        : Text("Save"),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Banners',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          BannerWidget(),
        ],
      ),
    );
  }
}
