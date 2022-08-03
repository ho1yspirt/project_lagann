class UserModel {
  final int id;
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const UserModel({
    required this.id,
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });

  static Future<UserModel> fromJSON(Map<String, dynamic> data) async {
    UserModel users = UserModel(
      id: data['id'],
      username: data['username'],
      profileImageUrl: data['profileImageUrl'],
      subscribers: data['subscribers'],
    );
    return users;
  }
}
