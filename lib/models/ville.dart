class Ville {
  String id;
  String nom;

  Ville({
    required this.id,
    required this.nom,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
  };

  factory Ville.fromJson(Map<String, dynamic> json) {
    return Ville(
      id: json['id'],
      nom: json['nom'],
    );
  }
}
