class UserModel {
  UserModel({
    required this.name,
    required this.id,
    required this.email,
    this.storiesId,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      storiesId: List<String>.from(json['storiesId']),
    );
  }

  String email;
  String name;
  String id;
  List<String>? storiesId;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      if (storiesId != null) 'storiesId': storiesId,
    };
  }
}
