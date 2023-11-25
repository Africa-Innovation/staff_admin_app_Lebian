// import 'dart:convert';


// class TicketInfo {
//   String? id;
//   final String villeDeDepart;
//   final String villeDArrive;
//   final String heureDepart;
//   final String dateDepart;
//   int prixPayer;
//   bool firstUse ;
//   bool secondUse;
//   bool alreadyUsed;
//   String? userId ;
//   bool allerRetour ;  // true if aller retour otherswise aller simple
//   String username;


//   TicketInfo({
//     this.id,
//     this.userId,
//     required this.villeDeDepart,
//     required this.villeDArrive,
//     required this.heureDepart,
//     required this.dateDepart,
//     required this.prixPayer,
//     this.firstUse= false,
//     this.secondUse = false,
//     this.alreadyUsed= false,
//     this.username = "",
//     required this.allerRetour
//   });

//   factory TicketInfo.fromJson(Map<String, dynamic> json) {
//     return TicketInfo(
//         id : json['id'],
//         villeDeDepart: json['ville_de_depart'],
//         villeDArrive: json['ville_d_arrive'],
//         heureDepart:  json['heure_de_depart'],
//         dateDepart: json['date_de_depart'],
//         prixPayer: json['prix_payer'],
//         firstUse:  json['fused'],
//         secondUse:  json['sused'],
//         userId: json['uid'],
//         allerRetour: json["aller_retour"],
//         alreadyUsed: json["already_used"],
//         username:  json["username"]
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       if(id != null)  "id" : id,
//       'ville_de_depart': villeDeDepart,
//       'ville_d_arrive': villeDArrive,
//       'heure_de_depart'  : heureDepart,
//       'date_de_depart' : dateDepart,
//       'prix_payer': prixPayer,
//       'sused' :secondUse,
//       'aller_retour' : allerRetour,
//       'fused' : firstUse,
//       'already_used' : alreadyUsed,
//       'username' : username,
//       if(userId != null) 'uid' : userId,
//     };
//   }

//   factory TicketInfo.fromJsonString(String jsonString) {
//     final Map<String, dynamic> json = jsonDecode(jsonString);
//     return TicketInfo.fromJson(json);
//   }

//   String toJsonString() {
//     return jsonEncode(toJson());
//   }

//   DateTime publicationDatetime() {

//     final  list = dateDepart.split('-');

//     return DateTime(
//        int.parse(list.first),
//        int.parse(list[1]),
//        int.parse(list[2])
//      );
//   }
// }

// // To parse this JSON data, do
// //
// //     final booking = bookingFromJson(jsonString);



import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  
  String? id;
    String date;
    String idTrajet;
    String idUsers;
    String heure;
    int ticketQuantity;
    int totalPrice;
    bool isOneWay;
    bool alreadyUse;
    bool firstUse;
    bool secondUse;
       

    Booking({
      required this.id,
        required this.date,
        required this.idTrajet,
        required this.idUsers,
        required this.isOneWay,
        required this.heure,
        required this.ticketQuantity,
        required this.totalPrice,
        required this.alreadyUse,
        required this.firstUse,
        required this.secondUse
     });

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
 
        id : json['id'],
        date: json["date"],
        idTrajet: json["id_trajet"],
        idUsers: json["id_users"],
        isOneWay: json["one_way"],
        heure: json["hour"],
        ticketQuantity: json["ticket_quantity"],
        totalPrice: json["totalPrice"],
        alreadyUse:  json["already_used"],
        firstUse:  json["first_used"],
        secondUse:  json["second_used"],
     );

    Map<String, dynamic> toJson() => {
      
      if(id != null)  "id" : id,
        "date": date,
        "id_trajet": idTrajet,
        "id_users": idUsers,
        "one_way": isOneWay,
        "hour": heure,
        "ticket_quantity": ticketQuantity,
        "totalPrice": totalPrice,
        "already_used":alreadyUse,
        "first_used":firstUse,
        "second_used":secondUse,
     };
     
  String toJsonString() {
    return jsonEncode(toJson());
  }


  DateTime publicationDatetime() {

    final  list = date.split('-');

    return DateTime(
       int.parse(list.first),
       int.parse(list[1]),
       int.parse(list[2])
     );
  }
  }


