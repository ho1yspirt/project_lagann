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
    return FractionallySizedBox(
      heightFactor: 0.45,
      child: Column(children: [
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
                  color: Color(0xFFF2F2F2),
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
                color: Color(0xFFF2F2F2),
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
                color: Color(0xFFF2F2F2),
                size: 32,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Flexible(
                flex: 2,
                child: Text(
                  S.of(context).setteings_message_dont_recom,
                  style: kChapterDefaultTS,
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
                color: Color(0xFFF2F2F2),
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
        Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 18,
              ),
              child: Icon(
                Ionicons.bookmark_outline,
                color: Color(0xFFF2F2F2),
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
      ]),
    );
  }
}
