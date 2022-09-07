import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/marathon.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/marathon_widgets/detailed_screen_item.dart';

import '../../generated/l10n.dart';
import '../../widgets/custom_tabbar_indicator.dart';
import '../../widgets/marathon_widgets/tab_bar_about.dart';
import '../../widgets/marathon_widgets/tab_bar_statistics.dart';
import '../../widgets/marathon_widgets/tab_bar_video.dart';

class MarathonDetailedScreen extends StatefulWidget {
  final MarathonModel marathonModel;
  const MarathonDetailedScreen(this.marathonModel, {Key? key})
      : super(key: key);

  @override
  State<MarathonDetailedScreen> createState() => _MarathonDetailedScreenState();
}

class _MarathonDetailedScreenState extends State<MarathonDetailedScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: kBackgroundColor,
        ),
        centerTitle: false,
        titleSpacing: -10,
        toolbarHeight: 48,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Marathon",
          style: kSliverAppBarTS,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Ionicons.arrow_back),
          ),
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: kSurfaceColor),
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
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
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        DetailedScreenItem(
                                          Ionicons.person_outline,
                                          S.of(context).marathon_detailed_item1,
                                          widget.marathonModel
                                                  .participantsQantyti ??
                                              "253",
                                        ),
                                        DetailedScreenItem(
                                          Ionicons.layers_outline,
                                          S.of(context).marathon_detailed_item2,
                                          widget.marathonModel.category,
                                        ),
                                        DetailedScreenItem(
                                          Ionicons.extension_puzzle_outline,
                                          S.of(context).marathon_detailed_item3,
                                          widget.marathonModel.stagesQantyti ??
                                              "12/15",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 16),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Ionicons.notifications_outline,
                                          color: kGreyColor,
                                          size: kIconSize8,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 304,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "START GAME - ${widget.marathonModel.price}",
                                          style: kSubtitle2.copyWith(
                                            color: kWhiteColor,
                                            letterSpacing: 1.25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 288,
                                    child: Text(
                                      widget.marathonModel.description,
                                      style: kHeadline4.copyWith(
                                        color: kWhiteColor,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("dd MMM yyyy")
                                        .format(widget.marathonModel.startDate),
                                    style: kBody2TS.copyWith(color: kGreyColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Created by ",
                                    style:
                                        kSubtitle2.copyWith(color: kWhiteColor),
                                  ),
                                  Text(
                                    "Andrew Pech",
                                    style: kSubtitle2.copyWith(
                                        color: kPrimaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: kSurfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    elevation: 1,
                    shadowColor: kSurfaceColor,
                    forceElevated: true,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 0,
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: const Size(110, 36),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: TabBar(
                          controller: _tabController,
                          splashBorderRadius: BorderRadius.circular(5),
                          indicatorColor: kPrimaryColor,
                          indicatorWeight: 4,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator:
                              const CustomTabIndicator(color: kPrimaryColor),
                          tabs: [
                            SizedBox(
                              height: 32,
                              child: Tab(
                                child: Text(
                                  S.of(context).marathon_tab_bar_about,
                                  style:
                                      kHeadline5.copyWith(color: kWhiteColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: Tab(
                                child: Text(
                                  S.of(context).marathon_tab_bar_video,
                                  style:
                                      kHeadline5.copyWith(color: kWhiteColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: Tab(
                                child: Text(
                                  S.of(context).marathon_tab_bar_statistics,
                                  style:
                                      kHeadline5.copyWith(color: kWhiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              body: Padding(
                padding: const EdgeInsets.only(top: 52),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    TabBarAbout(),
                    TabBarVideo(),
                    TabBarStatistics(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
