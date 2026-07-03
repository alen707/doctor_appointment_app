class HospitalModel {
  final int id;
  final String name;
  final String address;
  final String city;
  final String zipCode;
  final double rating;
  final int reviews;
  final String distance;
  final String duration;
  final String type;
  final bool isFavorite;
  final String image;

HospitalModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.duration,
    required this.type,
    required this.isFavorite,
    required this.image,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      address: json["address"] ?? "",
      city: json["city"] ?? "",
      zipCode: json["zipCode"] ?? "",
      rating: (json["rating"] as num).toDouble(),
      reviews: json["reviews"] ?? 0,
      distance: json["distance"] ?? "",
      duration: json["duration"] ?? "",
      type: json["type"] ?? "",
      isFavorite: json["isFavorite"] ?? false,
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "city": city,
      "zipCode": zipCode,
      "rating": rating,
      "reviews": reviews,
      "distance": distance,
      "duration": duration,
      "type": type,
      "isFavorite": isFavorite,
      "image": image,
    };
  }

HospitalModel copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? zipCode,
    double? rating,
    int? reviews,
    String? distance,
    String? duration,
    String? type,
    bool? isFavorite,
    String? image,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
      image: image ?? this.image,
    );
  }
}