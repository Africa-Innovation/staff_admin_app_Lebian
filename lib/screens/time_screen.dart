import 'package:flutter/material.dart';

class ManageTime extends StatefulWidget {
  const ManageTime({super.key});

  @override
  State<ManageTime> createState() => _ManageTimeState();
}

class _ManageTimeState extends State<ManageTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: TextField(
                    //controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Add time'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "valider",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey.shade200),
                    columns: [
                      DataColumn(label: Text("Time")),
                      DataColumn(label: Text("Action")),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("10h00")),
                        DataCell(Text("delete or update")),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
