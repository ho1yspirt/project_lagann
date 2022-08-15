import '../models/user.dart';

class VideoModel {
  final String id;
  final UserModel author;
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;
  final String commentsCount;

  const VideoModel(
      {required this.id,
      required this.author,
      required this.title,
      required this.thumbnailUrl,
      required this.videoUrl,
      required this.duration,
      required this.timestamp,
      required this.viewCount,
      required this.likes,
      required this.dislikes,
      required this.commentsCount});

  // Map<String, dynamic> toJSON() {
  //   Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['author']
  // }

  static Future<VideoModel> fromJSON(Map<String, dynamic> data) async {
    VideoModel video = VideoModel(
        id: data['id'],
        author: data['author'],
        title: data['title'],
        thumbnailUrl: data['thumbnaiUrl'],
        videoUrl: data['videoUrl'],
        duration: data['duration'],
        timestamp: data['timestamp'],
        viewCount: data['viewCount'],
        likes: data['likes'],
        dislikes: data['dislikes'],
        commentsCount: data['commentCount']);
    return video;
  }
}
