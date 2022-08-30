import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/comment.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/custom_choice_chips.dart';
import 'package:project_lagann/widgets/notification_widgets/notification_comment_item.dart';
import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../widgets/notification_widgets/notification_like_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static const UserModel _testUser = UserModel(
    id: 1,
    username: "Andrew Pech",
    profileImageUrl:
        'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
    subscribers: "69",
  );
  static final VideoModel _testVideo = VideoModel(
    id: '1',
    author: _testUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl:
        'https://thumbs.dreamstime.com/b/d-mural-wallpaper-beautiful-view-landscape-background-old-arches-tree-sun-water-birds-flowers-transparent-curtains-166191190.jpg',
    videoUrl: "https://youtu.be/2XOciSjxocI",
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
    commentsCount: "250",
  );

  final List<CommentModel> _testCommnetList = [
    CommentModel(
        id: '1',
        author: _testUser,
        video: _testVideo,
        description:
            'В жизни больше твои видео не посмотрю, чмо пузатое. Даже фулла нет. Еще и курсы платные, 12/10',
        timestamp: DateTime(2021, 3, 20),
        likes: '69',
        repliesCount: '2',
        commentType: 'Commented'),
    CommentModel(
        id: '2',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '-1',
        repliesCount: '0',
        commentType: 'Replied'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        title: Text(S.of(context).navbar_notifications),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 55),
          child: CustomChoiceChips(
            selectedChipIndex: 0,
            chipsList: [
              ChipFilter('All', () {}),
              ChipFilter('Comments', () {}),
              ChipFilter('Likes', () {}),
              ChipFilter('Courses', () {}),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final comment = _testCommnetList[index];
                return NotificationCommentItem(
                  commentModel: comment,
                );
              },
              childCount: _testCommnetList.length,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const NotificationLikeItem(),
            const NotificationLikeItem(),
          ])),
        ],
      ),
    );
  }
}
