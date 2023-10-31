
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bool isExpanded = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Navigation Rail
          

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigation menu
                    
                    SizedBox(
                      height: 8.0,
                    ),
                    // ...

// ...
                    SizedBox(
                      height: 200, // Spécifiez la hauteur souhaitée ici
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_outlined,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Utilisateurs",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "10000000",
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25,),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.airplane_ticket_outlined,
                                        color: Colors.red,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Reservation",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "100000",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25,),
                      
                          SizedBox(width: 25),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: 26.0,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Revenue",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "10.000.000 \$",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
// ...

// ...

                    SizedBox(height: MediaQuery.of(context).size.width*0.01),
                    Container(
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "type article title",
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.01),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey.shade200),
                        columns: [
                          DataColumn(label: Text("Nom")),
                          DataColumn(label: Text("Prenom")),                         
                          DataColumn(label: Text("Heure de depart")),
                          DataColumn(label: Text("Heure de retour")),
                          DataColumn(label: Text("Type de ticket")),
                          DataColumn(label: Text("Date de reservation")),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("OUEDRAOGO")),
                            DataCell(Text("Boris")),
                            DataCell(Text("15h.00")),
                            DataCell(Text("7h.00")),
                            DataCell(Text("Aller Retour")),
                            DataCell(Text("${DateTime.now()}")),
                            
                          ]
                          ),
                            DataRow(cells: [
                            DataCell(Text("OUEDRAOGO")),
                            DataCell(Text("Boris")),
                            DataCell(Text("15h.00")),
                            DataCell(Text("7h.00")),
                            DataCell(Text("Aller Retour")),
                            DataCell(Text("${DateTime.now()}")),
                            
                          ]
                          
                          ),
                          DataRow(cells: [
                            DataCell(Text("OUEDRAOGO")),
                            DataCell(Text("Boris")),
                            DataCell(Text("15h.00")),
                            DataCell(Text("7h.00")),
                            DataCell(Text("Aller Retour")),
                            DataCell(Text("${DateTime.now()}")),
                            
                          ]
                          )
                        ],
                        
                      ),
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

