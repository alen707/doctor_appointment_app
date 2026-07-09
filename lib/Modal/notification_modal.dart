class NotificationModal {
  final bool success;
  final String message;
  final List<NotificationItem> notifications;

  NotificationModal({
    required this.success,
    required this.message,
    required this.notifications,
  });

  factory NotificationModal.fromJson(Map<String, dynamic> json) {
    return NotificationModal(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      notifications: (json["notifications"] as List<dynamic>? ?? [])
          .map((e) => NotificationItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "notifications": notifications.map((e) => e.toJson()).toList(),
    };
  }

  NotificationModal copyWith({
    bool? success,
    String? message,
    List<NotificationItem>? notifications,
  }) {
    return NotificationModal(
      success: success ?? this.success,
      message: message ?? this.message,
      notifications: notifications ?? this.notifications,
    );
  }
}

class NotificationItem {
  final int id;
  final String title;
  final String message;
  final String image;
  final DateTime createdAt;
  final bool isRead;
  final String type;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.image,
    required this.createdAt,
    required this.isRead,
    required this.type,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      message: json["message"] ?? "",
      image: json["image"] ?? "",
      createdAt: DateTime.parse(
        json["createdAt"] ?? DateTime.now().toIso8601String(),
      ),
      isRead: json["isRead"] ?? false,
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "message": message,
      "image": image,
      "createdAt": createdAt.toIso8601String(),
      "isRead": isRead,
      "type": type,
    };
  }

  NotificationItem copyWith({
    int? id,
    String? title,
    String? message,
    String? image,
    DateTime? createdAt,
    bool? isRead,
    String? type,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'NotificationItem(id: $id, title: $title, createdAt: $createdAt)';
  }
}