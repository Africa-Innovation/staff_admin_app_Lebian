import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String userId;
   bool isActive;
  final String name;
  final String number;
  final String pictureUrl;


  UserData({
    required this.userId,
    required this.isActive,
    required this.name,
    required this.number,
    required this.pictureUrl
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['id_user'],
      isActive: json['isActive'],
      name: json['name'],
      number:json['number'],
      pictureUrl: json['picture_url']
    );
  }
    factory UserData.fromSnapshot(DocumentSnapshot? snapshot) {
    if (snapshot == null || !snapshot.exists) {
      return UserData(
        userId: '',
        isActive: true, // Provide a default value
        name: '', // Provide a default value
        number: '', // Provide a default value
        pictureUrl: '', // Provide a default value
      );
    }

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      userId: snapshot.id,
       isActive: data['isActive'],

      name: data['name'] ?? '', // Provide a default value
      number: data['number'] ?? '', // Provide a default value
      pictureUrl: data['picture_url'] ?? '', // Provide a default value
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'isActive': isActive,
      'name': name,
      'number': number,
      'picture_url': pictureUrl,
    };
  }
}