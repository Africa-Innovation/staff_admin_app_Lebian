// // import 'package:flutter/material.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   //bool isExpanded = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Row(
// //         children: [
// //           // Navigation Rail

// //           Expanded(
// //             child: Padding(
// //               padding: EdgeInsets.all(40.0),
// //               child: SingleChildScrollView(
// //                 // physics: NeverScrollableScrollPhysics(),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Navigation menu

// //                     SizedBox(
// //                       height: 8.0,
// //                     ),
// //                     // ...

// // // ...
// //                     SizedBox(
// //                       height: 200, // Spécifiez la hauteur souhaitée ici
// //                       child: ListView(
// //                         scrollDirection: Axis.horizontal,
// //                         children: [
// //                           Card(
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(12.0),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Icon(
// //                                         Icons.supervised_user_circle_outlined,
// //                                         size: 26.0,
// //                                       ),
// //                                       SizedBox(
// //                                         width: 8.0,
// //                                       ),
// //                                       Text(
// //                                         "Utilisateurs",
// //                                         style: TextStyle(
// //                                           fontSize: 26.0,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   SizedBox(
// //                                     height: 8.0,
// //                                   ),
// //                                   Text(
// //                                     "10000000",
// //                                     style: TextStyle(
// //                                       fontSize: 36,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(width: 25,),
// //                           Card(
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(12.0),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Icon(
// //                                         Icons.airplane_ticket_outlined,
// //                                         color: Colors.red,
// //                                         size: 26.0,
// //                                       ),
// //                                       SizedBox(
// //                                         width: 8.0,
// //                                       ),
// //                                       Text(
// //                                         "Reservation",
// //                                         style: TextStyle(
// //                                           color: Colors.red,
// //                                           fontSize: 26.0,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   SizedBox(
// //                                     height: 8.0,
// //                                   ),
// //                                   Text(
// //                                     "100000",
// //                                     style: TextStyle(
// //                                       color: Colors.red,
// //                                       fontSize: 36,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(width: 25,),

// //                           SizedBox(width: 25),
// //                           Card(
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(12.0),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Icon(
// //                                         Icons.monetization_on_outlined,
// //                                         size: 26.0,
// //                                         color: Colors.green,
// //                                       ),
// //                                       SizedBox(
// //                                         width: 8.0,
// //                                       ),
// //                                       Text(
// //                                         "Revenue",
// //                                         style: TextStyle(
// //                                           color: Colors.green,
// //                                           fontSize: 26.0,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   SizedBox(
// //                                     height: 8.0,
// //                                   ),
// //                                   Text(
// //                                     "10.000.000 \$",
// //                                     style: TextStyle(
// //                                       color: Colors.green,
// //                                       fontSize: 36,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// // // ...

// // // ...

// //                     SizedBox(height: MediaQuery.of(context).size.width*0.01),
// //                     Container(
// //                       width: 500,
// //                       child: Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 16.0),
// //                         child: TextField(
// //                           decoration: InputDecoration(
// //                             hintText: "type article title",
// //                             suffixIcon: Icon(Icons.search),
// //                             border: OutlineInputBorder(
// //                               borderSide: BorderSide(
// //                                 color: Colors.black26,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: MediaQuery.of(context).size.width*0.01),
// //                     SingleChildScrollView(
// //                       scrollDirection: Axis.horizontal,
// //                       child: DataTable(
// //                         headingRowColor: MaterialStateProperty.resolveWith(
// //                             (states) => Colors.grey.shade200),
// //                         columns: [
// //                           DataColumn(label: Text("Nom")),
// //                           DataColumn(label: Text("Prenom")),
// //                           DataColumn(label: Text("Heure de depart")),
// //                           DataColumn(label: Text("Heure de retour")),
// //                           DataColumn(label: Text("Type de ticket")),
// //                           DataColumn(label: Text("Date de reservation")),
// //                         ],
// //                         rows: [
// //                           DataRow(cells: [
// //                             DataCell(Text("OUEDRAOGO")),
// //                             DataCell(Text("Boris")),
// //                             DataCell(Text("15h.00")),
// //                             DataCell(Text("7h.00")),
// //                             DataCell(Text("Aller Retour")),
// //                             DataCell(Text("${DateTime.now()}")),

// //                           ]
// //                           ),
// //                             DataRow(cells: [
// //                             DataCell(Text("OUEDRAOGO")),
// //                             DataCell(Text("Boris")),
// //                             DataCell(Text("15h.00")),
// //                             DataCell(Text("7h.00")),
// //                             DataCell(Text("Aller Retour")),
// //                             DataCell(Text("${DateTime.now()}")),

// //                           ]

// //                           ),
// //                           DataRow(cells: [
// //                             DataCell(Text("OUEDRAOGO")),
// //                             DataCell(Text("Boris")),
// //                             DataCell(Text("15h.00")),
// //                             DataCell(Text("7h.00")),
// //                             DataCell(Text("Aller Retour")),
// //                             DataCell(Text("${DateTime.now()}")),

// //                           ]
// //                           )
// //                         ],

// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:admin_dashboard/models/UserData.dart';
// import 'package:flutter/material.dart';

// import '../services/data_service.dart';
// import '../components/StatCard.dart';
// import '../models/book.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   //bool isExpanded = false;

//   //String filter = "";

//   final TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: SingleChildScrollView(
//                 // physics: NeverScrollableScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [

//                     const SizedBox(height: 8.0,),

//                     SizedBox(
//                       height: 200,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children:  [

//                           StreamBuilder<List<UserData>>(
//                             stream: DataService.streamAllUsers(),
//                             builder: (context, snapshot) {
//                               if (snapshot.hasError) {
//                                 return Center(child: Text('Error: ${snapshot.error}'));
//                               }

//                               if (!snapshot.hasData) {
//                                 return const Center(child: CircularProgressIndicator());
//                               }

//                               final usersList = snapshot.data;

//                               return StatCard(
//                                 icon: Icons.supervised_user_circle_outlined,
//                                 title: "Utilisateurs",
//                                 value: usersList!.length.toString(),
//                                 color: Colors.black,
//                               );
//                             },
//                           ),

//                           const SizedBox(width: 25),
//                           StreamBuilder<List<Booking>>(
//                             stream: DataService.streamAllTicketInfo(),
//                             builder: (context, snapshot) {
//                               if (snapshot.hasError) {
//                                 return Center(child: Text('Error: ${snapshot.error}'));
//                               }

//                               if (!snapshot.hasData) {
//                                 return const Center(child: CircularProgressIndicator());
//                               }

//                               final ticketInfoList = snapshot.data;

//                               return  StatCard(
//                                 icon: Icons.airplane_ticket_outlined,
//                                 title: "Reservation",
//                                 value: ticketInfoList!.length.toString(),
//                                 color: Colors.red,
//                               );
//                             },
//                           ),

//                           const SizedBox(width: 25),
//                           const StatCard(
//                             icon: Icons.monetization_on_outlined,
//                             title: "Revenue",
//                             value: "10.000.000 \$",
//                             color: Colors.green,
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                     SizedBox(
//                       width: 500,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: TextField(
//                            controller: controller,
//                           decoration: InputDecoration(
//                             hintText: "Type a name to search",
//                             suffixIcon: IconButton(
//                                 onPressed: (){

//                                   setState(() {

//                                     if(filter.isEmpty) {
//                                       filter = controller.text;
//                                     }else{
//                                       filter = "";
//                                       controller.text = "";
//                                     }
//                                   });

//                                }, icon: filter.isEmpty ?  const Icon(Icons.search) : const Icon(Icons.clear)),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.black26,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                 StreamBuilder<List<Booking>>(
//                   stream: DataService.streamAllTicketInfo(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     }

//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     var ticketInfoList = snapshot.data;

//                     if(ticketInfoList== null){
//                       return const Center(child: Text("No such Bookings"),);
//                     }
//                     ticketInfoList.sort((a, b) => a.publicationDatetime().compareTo(b.publicationDatetime()));

//                     if(filter.isNotEmpty){
//                     ticketInfoList =  ticketInfoList.where((element) => element.idUsers.trim().toLowerCase().contains(filter.trim().toLowerCase())).toList();

//                     }

//                     return
//                       SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
//                         columns: const [
//                           DataColumn(label: Text("Nom")),
//                           DataColumn(label: Text("Heure de depart")),
//                           DataColumn(label: Text("Type de ticket")),
//                           DataColumn(label: Text("Date de reservation")),
//                         ],
//                         rows: ticketInfoList.map((ticket) {
//                           return  DataRow(cells: [
//                              DataCell(Text(ticket.idUsers)),
//                              DataCell(Text(ticket.heure)),
//                              DataCell(Text( ticket.isOneWay ? "Aller-Retour" : "Aller simple")),
//                              DataCell(Text(ticket.date)),
//                           ]);
//                         }).toList(),
//                       ),
//                     );
//                   },
//                 ),

//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:admin_dashboard/models/userData.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/statCard.dart';
 
import '../models/book.dart';
import '../services/data_service.dart'; // Import Firestore

// ... (other imports)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filter = "";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          StreamBuilder<List<UserData>>(
                            stream: DataService.streamAllUsers(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }

                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              final usersList = snapshot.data;

                              return StatCard(
                                icon: Icons.supervised_user_circle_outlined,
                                title: "Utilisateurs",
                                value: usersList!.length.toString(),
                                color: Colors.black,
                              );
                            },
                          ),
                          const SizedBox(width: 25),
                          StreamBuilder<List<Booking>>(
                            stream: DataService.streamAllTicketInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }

                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              final ticketInfoList = snapshot.data;

                              return StatCard(
                                icon: Icons.airplane_ticket_outlined,
                                title: "Reservation",
                                value: ticketInfoList!.length.toString(),
                                color: Colors.red,
                              );
                            },
                          ),
                          const SizedBox(width: 25),
                          const StatCard(
                            icon: Icons.monetization_on_outlined,
                            title: "Revenue",
                            value: "10.000.000 \$",
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    SizedBox(
                        width: 500,
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                    hintText: "Type a name to search",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (filter.isEmpty) {
                                            filter = controller.text;
                                          } else {
                                            filter = "";
                                            controller.text = "";
                                          }
                                        });
                                      },
                                      icon: filter.isEmpty
                                          ? const Icon(Icons.search)
                                          : const Icon(Icons.clear),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ))))),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    StreamBuilder<List<Booking>>(
                  stream: DataService.streamAllTicketInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    var ticketInfoList = snapshot.data;

                    if(ticketInfoList== null){
                      return const Center(child: Text("No such Bookings"),);
                    }
                    ticketInfoList.sort((a, b) => a.publicationDatetime().compareTo(b.publicationDatetime()));

                    if(filter.isNotEmpty){
                    ticketInfoList =  ticketInfoList.where((element) => element.idUsers.trim().toLowerCase().contains(filter.trim().toLowerCase())).toList();

                    }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200),
                            columns: const [
                              DataColumn(label: Text("Nom")),
                              DataColumn(label: Text("Heure de depart")),
                              DataColumn(label: Text("Type de ticket")),
                              DataColumn(label: Text("Date de reservation")),
                            ],
                            rows: ticketInfoList.map((ticket) {
                              return DataRow(cells: [
                                DataCell(FutureBuilder<QuerySnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('users')
                                      .where('id_user',
                                          isEqualTo: ticket.idUsers)
                                      .get(),
                                  builder: (context, userSnapshot) {
                                    if (userSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text(
                                          'Loading...'); // You can use a loading indicator here.
                                    }
                                    if (userSnapshot.hasError) {
                                      return Text(
                                          'Error: ${userSnapshot.error}');
                                    }
                                    if (userSnapshot.hasData) {
                                      var userData = userSnapshot.data!.docs[0]
                                          .data() as Map<String, dynamic>;
                                      var userName = userData[
                                          'name']; // Adjust the field name as per your Firestore data structure.
                                      return Text(userName);
                                    }
                                    return Text('User not found');
                                  },
                                )),
                                DataCell(Text(ticket.heure)),
                                DataCell(Text(ticket.isOneWay
                                    ? "Aller-Retour"
                                    : "Aller simple")),
                                DataCell(Text(ticket.date)),
                              ]);
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
