import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/book.dart';
import '../models/UserData.dart';

class DataService {
 static final CollectionReference _ticketInfoCol =
  FirebaseFirestore.instance.collection("booking");
 static final CollectionReference _userCol =
  FirebaseFirestore.instance.collection("users");

  static Stream<List<Booking>> streamAllTicketInfo() {
    return _ticketInfoCol.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Booking.fromJson(doc.data() as Map<String,dynamic>))
          .toList();
    });
  }

 static Stream<List<UserData>> streamAllUsers() {
    return _userCol.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UserData.fromJson(doc.data() as Map<String,dynamic>))
          .toList();
    });
  }
}