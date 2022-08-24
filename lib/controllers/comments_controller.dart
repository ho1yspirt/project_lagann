import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';

import '../generated/l10n.dart';
import '../screens/commentss_screen.dart';
import '../utils/constants.dart';

class CommentsController extends ChangeNotifier {
  void onTapCommets(BuildContext context, VideoModel videoModel) {
    showFlexibleBottomSheet(
      context: context,
      isModal: false,
      isDismissible: false,
      minHeight: 0.685,
      initHeight: 0.685,
      maxHeight: 0.685,
      anchors: [0, 0.685],
      useRootNavigator: true,
      bottomSheetColor: kBackgroundColor,
      builder: (
        BuildContext context,
        ScrollController scrollController,
        _,
      ) {
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
                        videoModel.commentsCount,
                        style: kSliverAppBarTS.copyWith(
                          color: const Color(0xFFF2F2F2).withOpacity(0.4),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.options),
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
              child: CommentsScreen(scrollController),
            ),
          ],
        );
      },
    );
  }
}
