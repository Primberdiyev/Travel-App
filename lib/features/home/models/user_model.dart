class UserModel {
  UserModel({
    required this.name,
    required this.id,
    required this.email,
    List<String>? storiesId,
    List<String>? fansId,
    List<String>? followingsId,
    List<String>? postsId,
  })  : storiesId = storiesId ?? [],
        fansId = fansId ?? [],
        followingsId = followingsId ?? [],
        postsId = postsId ?? [];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      storiesId:
          json['storiesId'] != null ? List<String>.from(json['storiesId']) : [],
      fansId: json['fansId'] != null ? List<String>.from(json['fansId']) : [],
      followingsId: json['followingsId'] != null
          ? List<String>.from(json['followingsId'])
          : [],
      postsId:
          json['postsId'] != null ? List<String>.from(json['postsId']) : [],
    );
  }

  String email;
  String name;
  String id;
  List<String> storiesId;
  List<String> fansId;
  List<String> followingsId;
  List<String> postsId;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'storiesId': storiesId,
      'postsId': postsId,
      'fansId': fansId,
      'followingsId': followingsId,
    };
  }
}
