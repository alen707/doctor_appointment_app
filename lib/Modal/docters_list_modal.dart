class DocterListModal {
  final int id;
  final String name;
  final String specialization;
  final String hospital;
  final String location;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final String image;

  DocterListModal({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    required this.image,
  });

  factory DocterListModal.fromJson(Map<String, dynamic> json) {
    return DocterListModal(
      id: json["id"],
      name: json["name"],
      specialization: json["specialization"],
      hospital: json["hospital"],
      location: json["location"],
      rating: (json["rating"] as num).toDouble(),
      reviews: json["reviews"],
      isFavorite: json["isFavorite"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "specialization": specialization,
      "hospital": hospital,
      "location": location,
      "rating": rating,
      "reviews": reviews,
      "isFavorite": isFavorite,
      "image": image,
    };
  }
}