import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


// class BannerWidget extends StatefulWidget {
//   const BannerWidget({Key? key});

//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
//   @override
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//    List<String> imageUrls = []; // Stocke les URL des images depuis Firestore

//  void initState() {
//     super.initState();
//     getDataFromFirestore(); // Récupérer les données Firestore au démarrage
//   }

//     void getDataFromFirestore() async {
//   QuerySnapshot querySnapshot = await _firestore.collection('banners').get();

//   setState(() {
//     imageUrls = querySnapshot.docs
//         .map<String?>((doc) {
//           final data = doc.data() as Map<String, dynamic>;
//           return data['image'] as String?;
//         })
//         .where((url) => url != null)
//         .cast<String>() // Assurez-vous que la liste ne contient que des String non nullables
//         .toList();
//   });
// }


//  Future<void> deleteBanner(String bannerUrl) async {
//     try {
//       await _firestore
//           .collection('banners')
//           .where('image', isEqualTo: bannerUrl)
//           .get()
//           .then((querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//           doc.reference.delete();
//         });
//       });
//       setState(() {
//         imageUrls.remove(bannerUrl);
//       });
//       // Afficher un message de suppression réussie
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Image supprimée avec succès'),
//         ),
//       );
//     } catch (e) {
//       // En cas d'erreur lors de la suppression, afficher un message d'erreur
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Erreur lors de la suppression : $e'),
//         ),
//       );
//     }
//   }
//   Widget build(BuildContext context) {
//          return   Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Wrap(
//         spacing: 20,
//         runSpacing: 20,
//         children: imageUrls.map((url) {
//           return Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: CachedNetworkImage(
//                   imageUrl: url,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) =>
//                       CircularProgressIndicator(),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//               ElevatedButton(
//               onPressed: () {
//                 // Afficher une boîte de dialogue de confirmation
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Confirmation'),
//                       content: Text('Voulez-vous supprimer cette image ?'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Annuler'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             deleteBanner(url);
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Supprimer'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text('Supprimer'),
//             ),
//             ],
//           );
//         }).toList(),
//       ),
//     );
          
      
//       }}


class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('banners').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Une erreur s\'est produite'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<String> imageUrls = snapshot.data!.docs
            .map<String>((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return data['image'] as String;
            })
            .toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: imageUrls.map((url) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: Text('Voulez-vous supprimer cette image ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Annuler'),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteBanner(url);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Supprimer'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Supprimer'),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Future<void> deleteBanner(String bannerUrl) async {
    try {
      await _firestore
          .collection('banners')
          .where('image', isEqualTo: bannerUrl)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la suppression : $e'),
        ),
      );
    }
  }
}
