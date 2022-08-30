import '../models/user.dart';
import '../models/video.dart';

class CommentModel {
  final String id;
  final UserModel author;
  final String description;
  final DateTime timestamp;
  final String likes;
  final String? repliesCount;
  final String commentType;
  final VideoModel video;

  const CommentModel({
    required this.id,
    required this.author,
    required this.video,
    required this.description,
    required this.timestamp,
    required this.likes,
    this.repliesCount,
    required this.commentType,
  });

  static Future<CommentModel> fromJSON(Map<String, dynamic> data) async {
    CommentModel comment = CommentModel(
        id: data['id'],
        author: data['author'],
        video: data['video'],
        description: data['description'],
        timestamp: data['timestamp'],
        likes: data['likes'],
        repliesCount: data['repliesCount'],
        commentType: data['commentType']);
    return comment;
  }
}
