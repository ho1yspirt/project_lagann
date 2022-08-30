// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class SearchFilterDialog extends StatefulWidget {
  // final Widget? otherWidget;
  final String title;
  final List<SearchFilterDialogItem> widgetSet;
  const SearchFilterDialog({
    Key? key,
    required this.title,
    required this.widgetSet,
    // this.otherWidget,
  }) : super(key: key);

  @override
  State<SearchFilterDialog> createState() => _SearchFilterDialogState();
}

class _SearchFilterDialogState extends State<SearchFilterDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Text(
              widget.title,
              style: kHeadline4.copyWith(color: kWhiteColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(children: widget.widgetSet),
          ),
          // widget.otherWidget,
          Container(
            height: 2,
            color: kSurfaceColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).action_cancel)),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).action_apply))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchFilterDialogItem extends StatelessWidget {
  final String title;
  Widget customDropDownButton;
  SearchFilterDialogItem(
      {Key? key, required this.title, required this.customDropDownButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kBody2TS.copyWith(color: kGreyColor),
        ),
        customDropDownButton,
      ],
    );
  }
}
