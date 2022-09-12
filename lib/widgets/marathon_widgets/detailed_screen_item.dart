import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DetailedScreenItem extends StatelessWidget {
  final IconData icon;
  final String firstTitle;
  final String secondTitle;
  const DetailedScreenItem(this.icon, this.firstTitle, this.secondTitle,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: 117,
            decoration: BoxDecoration(
              color: kSurfaceColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: kIconSize6,
                ),
                Text(
                  firstTitle,
                  style: kCaptionsTS.copyWith(color: kGreyColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    secondTitle,
                    overflow: TextOverflow.ellipsis,
                    style: kSubtitle1.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
