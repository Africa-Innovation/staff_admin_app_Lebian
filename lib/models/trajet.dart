 

// class Trajet {
//     String cityArrival;
//     String cityDeparture;
//     bool isActive;
//     int price;
//     List<String> timeDeparture; // Modifier le type en List<String> pour recevoir une liste d'heures

//     Trajet({
//         required this.cityArrival,
//         required this.cityDeparture,
//         required this.isActive,
//         required this.price,
//           this.timeDeparture= const []
//     });

//     factory Trajet.fromJson(Map<String, dynamic> json) => Trajet(
//         cityArrival: json["city_arrival"],
//         cityDeparture: json["city_departure"],
//         isActive: json["isActive"],
//         price: json["price"],
//         timeDeparture: List<String>.from(json["time_departure"]), // Convertir les données Firestore en liste d'heures
//     );

//     Map<String, dynamic> toJson() => {
//         "city_arrival": cityArrival,
//         "city_departure": cityDeparture,
//         "isActive": isActive,
//         "price": price,
//         "time_departure": timeDeparture,
//     };
// }

 class Trajet {
  String cityArrival;
  String cityDeparture;
  bool isActive;
  int price;
  List<String> timeDeparture;

  Trajet({
    required this.cityArrival,
    required this.cityDeparture,
    required this.isActive,
    required this.price,
    this.timeDeparture = const [],
  });

  Map<String, dynamic> toJson() => {
       "city_arrival": cityArrival,
        "city_departure": cityDeparture,
        "isActive": isActive,
        "price": price,
        "time_departure": timeDeparture,
  };

  factory Trajet.fromJson(Map<String, dynamic> json) => Trajet(
        cityArrival: json["city_arrival"],
        cityDeparture: json["city_departure"],
        isActive: json["isActive"],
        price: json["price"],
        timeDeparture: List<String>.from(json["time_departure"]),
  );
}
