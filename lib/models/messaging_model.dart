class UserModel {
  final String id;

  UserModel({required this.id});
}

class MessageModel {
  final String id;
  final String text;
  final UserModel author;
  final int createdAt;

  MessageModel({
    required this.id,
    required this.text,
    required this.author,
    required this.createdAt,
  });
}