import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../generated/l10n.dart';
import '../utils/constants.dart';

class SettingElements extends StatelessWidget {
  const SettingElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.4,
      child: Column(children: [
        GestureDetector(
          onTap: (() {}),
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
                  S.of(context).settings_message_share,
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
                S.of(context).settings_message_notinterested,
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
              child: Text(
                S.of(context).setteings_message_dont_recom,
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
                S.of(context).setteings_message_report,
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
                S.of(context).setteings_message_save,
                style: kChapterDefaultTS,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
