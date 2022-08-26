import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

import '../generated/l10n.dart';
import '../models/video.dart';
import '../screens/comments_screen.dart';
import '../utils/constants.dart';

class CommentsHeader extends StatefulWidget {
  final VideoModel videoModel;
  final ScrollController scrollController;
  const CommentsHeader(this.videoModel, this.scrollController, {Key? key})
      : super(key: key);

  @override
  State<CommentsHeader> createState() => _CommentsHeaderState();
}

class _CommentsHeaderState extends State<CommentsHeader> {
  // static const List<MenuItem> firstItems = [topComments, newComments, oldComments];

  MenuItem topComments = MenuItem(text: S.current.comments_pop_up_item1);
  MenuItem newComments = MenuItem(text: S.current.comments_pop_up_item2);
  MenuItem oldComments = MenuItem(text: S.current.comments_pop_up_item3);

  List<bool> selectedFilters = [true, false, false];
  int currentIndex = 0;

  onChanged(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    } else {
      setState(() {
        selectedFilters[currentIndex] = false;
        selectedFilters[index] = true;
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 52,
            child: Row(
              children: [
                Text(
                  S.of(context).commetns_title,
                  style: kSliverAppBarTS,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    widget.videoModel.commentsCount,
                    style: kSliverAppBarTS.copyWith(
                      color: const Color(0xFFF2F2F2).withOpacity(0.4),
                    ),
                  ),
                ),
                const Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: const Icon(
                      Ionicons.options,
                      color: kWhiteColor,
                    ),
                    customItemsIndexes: const [3],
                    customItemsHeight: 48,
                    items: [
                      // ...firstItems.map(
                      //   (item) => DropdownMenuItem<MenuItem>(
                      //     value: item,
                      //     child: buildItem(item),
                      //   ),
                      // ),
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          topComments.text,
                          style: selectedFilters[0]
                              ? kChapterDefaultTS
                              : kChapterDefaultTS.copyWith(
                                  color: kSurfaceColorWithOpacity,
                                ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          newComments.text,
                          style: selectedFilters[1]
                              ? kChapterDefaultTS
                              : kChapterDefaultTS.copyWith(
                                  color: kSurfaceColorWithOpacity,
                                ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          oldComments.text,
                          style: selectedFilters[2]
                              ? kChapterDefaultTS
                              : kChapterDefaultTS.copyWith(
                                  color: kSurfaceColorWithOpacity,
                                ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      onChanged(context, value as int);
                    },
                    itemHeight: 48,
                    dropdownWidth: 258,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBackgroundColor,
                    ),
                    offset: const Offset(-230, 20),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight
                    ]);
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(
                    Ionicons.close,
                    size: kIconSize7,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: CommentsScreen(widget.scrollController),
        ),
      ],
    );
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuItems {}
