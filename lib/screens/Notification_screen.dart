import 'package:flutter/material.dart';

class ManageNotification extends StatefulWidget {
  const ManageNotification({super.key});

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 100,
                child: TextField(
                  //controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Send notifications'),
                ),
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
            
          ],
        ),
      ),
    );
  }
}