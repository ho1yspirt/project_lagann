import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/comment_item.dart';

import '../generated/l10n.dart';
import '../models/comment.dart';
import '../models/user.dart';
import '../models/video.dart';
import '../utils/constants.dart';

class CommentsScreen extends StatefulWidget {
  final ScrollController scrollController;
  const CommentsScreen(this.scrollController, {Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();
  double height1 = 36;
  double height2 = 52;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _textEditingController.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    print("Focus: ${_focus.hasFocus.toString()}");
    if (height1 == 36 && height2 == 52) {
      setState(() {
        height1 = 80;
        height2 = 90;
      });
    } else {
      setState(() {
        height1 = 36;
        height2 = 52;
      });
    }
  }

  static const UserModel _testUser = UserModel(
    id: 1,
    username: "UX/UI:Structure",
    profileImageUrl:
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
    subscribers: "2000",
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
    description: '',
  );

  final List<CommentModel> _testCommnetList = [
    CommentModel(
        id: '1',
        author: _testUser,
        video: _testVideo,
        description:
            'В жизни больше твои видео не посмотрю, чмо пузатое. Даже фулла нет. Еще и курсы платные, 12/10, ',
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
    CommentModel(
        id: '3',
        author: _testUser,
        video: _testVideo,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timestamp: DateTime(2022, 3, 20),
        likes: '123',
        repliesCount: '0',
        commentType: 'Replied'),
    CommentModel(
        id: '4',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '1',
        repliesCount: '0',
        commentType: 'Replied'),
    CommentModel(
        id: '5',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '65',
        repliesCount: '0',
        commentType: 'Replied'),
    CommentModel(
        id: '6',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '5000',
        repliesCount: '0',
        commentType: 'Replied'),
  ];

  final List<CommentModel> _testReply = [
    CommentModel(
        id: '3',
        author: _testUser,
        video: _testVideo,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timestamp: DateTime(2022, 3, 20),
        likes: '123',
        commentType: 'Replied'),
    CommentModel(
        id: '4',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '1',
        commentType: 'Replied'),
    CommentModel(
        id: '5',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '65',
        commentType: 'Replied'),
    CommentModel(
        id: '6',
        author: _testUser,
        video: _testVideo,
        description: 'ШЕДЕВР!!!',
        timestamp: DateTime(2022, 3, 20),
        likes: '5000',
        commentType: 'Replied'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: kSurfaceColor,
      ),
      child: GestureDetector(
        onTap: () {
          _textEditingController.text == ''
              ? FocusManager.instance.primaryFocus?.unfocus()
              : showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(S.of(context).comments_save_title),
                      titleTextStyle: kSliverAppBarTS,
                      actions: [
                        TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.previousFocus();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "No",
                            style:
                                kChapterActiveTS.copyWith(color: kPrimaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _textEditingController.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Yes",
                            style:
                                kChapterActiveTS.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: ListView.builder(
                  controller: widget.scrollController,
                  itemCount: _testCommnetList.length,
                  itemBuilder: (context, index) {
                    var comment = _testCommnetList[index];
                    return CommentItem(
                        comment, _testReply, widget.scrollController);
                  },
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: height2,
                  color: kSurfaceColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: CircleAvatar(
                        foregroundImage:
                            NetworkImage(_testUser.profileImageUrl),
                        radius: 16,
                      ),
                    ),
                    SizedBox(
                      width: 290,
                      height: height1,
                      child: TextFormField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: height1 == 36
                            ? TextAlignVertical.bottom
                            : TextAlignVertical.center,
                        maxLines: 4,
                        minLines: 1,
                        style: kSubtitle2.copyWith(color: kWhiteColor),
                        focusNode: _focus,
                        decoration: InputDecoration(
                          hintText: "Write a comment...",
                          hintStyle: kSubtitle2.copyWith(color: kGreyColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: kSurfaceColorWithOpacity,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Icon(
                        Ionicons.send,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
