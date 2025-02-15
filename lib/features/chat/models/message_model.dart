class MessageModel {
  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    this.messageType = "text",
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      senderId: json["senderId"],
      receiverId: json["receiverId"],
      message: json["message"],
      timestamp: DateTime.parse(json["timestamp"]),
      isRead: json["isRead"] ?? false,
      messageType: json["messageType"] ?? "text",
    );
  }
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final String messageType;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "senderId": senderId,
      "receiverId": receiverId,
      "message": message,
      "timestamp": timestamp.toIso8601String(),
      "isRead": isRead,
      "messageType": messageType,
    };
  }
}
