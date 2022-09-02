import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/marathon.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/marathon_widgets/detailed_screen_item.dart';

import '../../generated/l10n.dart';

class MarathonDetailedScreen extends StatefulWidget {
  final MarathonModel marathonModel;
  const MarathonDetailedScreen(this.marathonModel, {Key? key})
      : super(key: key);

  @override
  State<MarathonDetailedScreen> createState() => _MarathonDetailedScreenState();
}

class _MarathonDetailedScreenState extends State<MarathonDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: false,
        titleSpacing: -10,
        toolbarHeight: 48,
        elevation: 0.0,
        title: const Text(
          "Marathon",
          style: kSliverAppBarTS,
        ),
        backgroundColor: Colors.white.withOpacity(0.0),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.chatbubbles_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.ellipsis_vertical,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.marathonModel.previewPhoto.first,
                      height: 356,
                      width: 238,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      DetailedScreenItem(
                        Ionicons.person_outline,
                        S.of(context).marathon_detailed_item1,
                        widget.marathonModel.participantsQantyti ?? "253",
                      ),
                      DetailedScreenItem(
                        Ionicons.layers_outline,
                        S.of(context).marathon_detailed_item2,
                        widget.marathonModel.category,
                      ),
                      DetailedScreenItem(
                        Ionicons.extension_puzzle_outline,
                        S.of(context).marathon_detailed_item3,
                        widget.marathonModel.stagesQantyti ?? "12/15",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
