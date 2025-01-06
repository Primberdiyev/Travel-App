class UserModel {
  UserModel({
    required this.name,
    required this.id,
    required this.email,
    this.storiesId,
    this.fans = 0,
    this.following = 0,
    this.postCount = 0,
    this.storyCount = 0,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      fans: json['fans'],
      following: json['following'],
      postCount: json['postCount'],
      storyCount: json['storyCount'],
      storiesId:
          json['storiesId'] != null ? List<String>.from(json['storiesId']) : [],
    );
  }

  String email;
  String name;
  String id;
  List<String>? storiesId;
  num fans;
  num following;
  num postCount;
  num storyCount;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      if (storiesId != null) 'storiesId': storiesId,
      'postCount': postCount,
      'storyCount': storiesId?.length ?? 0,
      'fans': fans,
      'following': following,
    };
  }
}
