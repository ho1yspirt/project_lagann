import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:ionicons/ionicons.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class SettingElements extends StatelessWidget {
  final String url;
  const SettingElements(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              FlutterShare.share(title: "Hello", linkUrl: url);
            },
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 18,
                  ),
                  child: Icon(
                    Ionicons.arrow_redo_outline,
                    color: kWhiteColor,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    S.of(context).action_share,
                    style: kChapterDefaultTS,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 18,
                ),
                child: Icon(
                  Ionicons.trash_outline,
                  color: kWhiteColor,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  S.of(context).action_notinterested,
                  style: kChapterDefaultTS,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 18,
                ),
                child: Icon(
                  Ionicons.ban,
                  color: kWhiteColor,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 10),
                child: SizedBox(
                  width: 262,
                  child: Text(
                    S.of(context).setteings_message_dont_recom,
                    style: kChapterDefaultTS,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 18,
                ),
                child: Icon(
                  Ionicons.flag_outline,
                  color: kWhiteColor,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  S.of(context).action_report,
                  style: kChapterDefaultTS,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 18,
                  ),
                  child: Icon(
                    Ionicons.bookmark_outline,
                    color: kWhiteColor,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    S.of(context).action_save,
                    style: kChapterDefaultTS,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
