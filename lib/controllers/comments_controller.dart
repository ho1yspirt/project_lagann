import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/comments_header.dart';

import '../utils/constants.dart';

class CommentsController extends ChangeNotifier {
  void onTapCommets(
    BuildContext context,
    VideoModel videoModel,
  ) {
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
        return CommentsHeader(videoModel, scrollController);
      },
    );
  }
}
