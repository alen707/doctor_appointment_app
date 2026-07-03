class DocterDetailsModal {
  bool success;
  String message;
  Data data;

  DocterDetailsModal({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DocterDetailsModal.fromJson(Map<String, dynamic> json) {
    return DocterDetailsModal(
      success: json["success"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data.toJson(),
    };
  }
}

class Data {
  int id;
  String name;
  String specialization;
  String hospital;
  String location;
  String profileImage;
  bool isFavorite;
  String patientsCount;
  int experienceYears;
  double rating;
  int reviewsCount;
  String about;
  WorkingTime workingTime;
  int consultationFee;
  List<String> languages;
  List<String> education;
  List<String> services;
  List<Review> reviews;
  Appointment appointment;

  Data({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.location,
    required this.profileImage,
    required this.isFavorite,
    required this.patientsCount,
    required this.experienceYears,
    required this.rating,
    required this.reviewsCount,
    required this.about,
    required this.workingTime,
    required this.consultationFee,
    required this.languages,
    required this.education,
    required this.services,
    required this.reviews,
    required this.appointment,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"],
      specialization: json["specialization"],
      hospital: json["hospital"],
      location: json["location"],
      profileImage: json["profile_image"],
      isFavorite: json["is_favorite"],
      patientsCount: json["patients_count"],
      experienceYears: json["experience_years"],
      rating: (json["rating"] as num).toDouble(),
      reviewsCount: json["reviews_count"],
      about: json["about"],
      workingTime: WorkingTime.fromJson(json["working_time"]),
      consultationFee: json["consultation_fee"],
      languages: List<String>.from(json["languages"]),
      education: List<String>.from(json["education"]),
      services: List<String>.from(json["services"]),
      reviews: List<Review>.from(
        json["reviews"].map((x) => Review.fromJson(x)),
      ),
      appointment: Appointment.fromJson(json["appointment"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "specialization": specialization,
      "hospital": hospital,
      "location": location,
      "profile_image": profileImage,
      "is_favorite": isFavorite,
      "patients_count": patientsCount,
      "experience_years": experienceYears,
      "rating": rating,
      "reviews_count": reviewsCount,
      "about": about,
      "working_time": workingTime.toJson(),
      "consultation_fee": consultationFee,
      "languages": languages,
      "education": education,
      "services": services,
      "reviews": reviews.map((x) => x.toJson()).toList(),
      "appointment": appointment.toJson(),
    };
  }
}

class Appointment {
  bool bookingEnabled;
  DateTime nextAvailable;

  Appointment({
    required this.bookingEnabled,
    required this.nextAvailable,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      bookingEnabled: json["booking_enabled"],
      nextAvailable: DateTime.parse(json["next_available"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "booking_enabled": bookingEnabled,
      "next_available": nextAvailable.toIso8601String(),
    };
  }
}

class Review {
  int id;
  String patientName;
  String patientImage;
  double rating;
  String review;
  DateTime reviewDate;

  Review({
    required this.id,
    required this.patientName,
    required this.patientImage,
    required this.rating,
    required this.review,
    required this.reviewDate,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json["id"],
      patientName: json["patient_name"],
      patientImage: json["patient_image"],
      rating: (json["rating"] as num).toDouble(),
      review: json["review"],
      reviewDate: DateTime.parse(json["review_date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "patient_name": patientName,
      "patient_image": patientImage,
      "rating": rating,
      "review": review,
      "review_date": reviewDate.toIso8601String(),
    };
  }
}

class WorkingTime {
  String days;
  String startTime;
  String endTime;

  WorkingTime({
    required this.days,
    required this.startTime,
    required this.endTime,
  });

  factory WorkingTime.fromJson(Map<String, dynamic> json) {
    return WorkingTime(
      days: json["days"],
      startTime: json["start_time"],
      endTime: json["end_time"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "days": days,
      "start_time": startTime,
      "end_time": endTime,
    };
  }
}