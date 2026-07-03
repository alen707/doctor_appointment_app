class BookingModal {
  final int id;
  final String date;
  final String time;
  final String doctorName;
  final String specialization;
  final String hospital;
  final String location;
  final String image;
  final String status;
  final bool isCancelled;

  BookingModal({
    required this.id,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.specialization,
    required this.hospital,
    required this.location,
    required this.image,
    required this.status,
    required this.isCancelled,
  });

  factory BookingModal.fromJson(Map<String, dynamic> json) {
    return BookingModal(
      id: json["id"] ?? 0,
      date: json["date"] ?? "",
      time: json["time"] ?? "",
      doctorName: json["doctorName"] ?? "",
      specialization: json["specialization"] ?? "",
      hospital: json["hospital"] ?? "",
      location: json["location"] ?? "",
      image: json["image"] ?? "",
      status: json["status"] ?? "",
      isCancelled: json["isCancelled"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "time": time,
      "doctorName": doctorName,
      "specialization": specialization,
      "hospital": hospital,
      "location": location,
      "image": image,
      "status": status,
      "isCancelled": isCancelled,
    };
  }

  BookingModal copyWith({
    int? id,
    String? date,
    String? time,
    String? doctorName,
    String? specialization,
    String? hospital,
    String? location,
    String? image,
    String? status,
    bool? isCancelled,
  }) {
    return BookingModal(
      id: id ?? this.id,
      date: date ?? this.date,
      time: time ?? this.time,
      doctorName: doctorName ?? this.doctorName,
      specialization: specialization ?? this.specialization,
      hospital: hospital ?? this.hospital,
      location: location ?? this.location,
      image: image ?? this.image,
      status: status ?? this.status,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }
}