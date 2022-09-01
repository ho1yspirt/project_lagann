import 'package:flutter/material.dart';
import 'package:project_lagann/widgets/marathon_widgets/marathon_home_item.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import '../../widgets/widgets.dart';

class MarathonHomeScreen extends StatefulWidget {
  const MarathonHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarathonHomeScreen> createState() => _MarathonHomeScreenState();
}

class _MarathonHomeScreenState extends State<MarathonHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SlivAppBar(
            title: S.of(context).marathon_app_bar_title,
          ),
          //Participation
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).marathon_chapter_title1,
                        style: kHeadline5.copyWith(color: kWhiteColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 316,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const MarathonHomeItem();
                    },
                  ),
                ),
              ],
            ),
          ),
          //Signed
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).marathon_chapter_title2,
                        style: kHeadline5.copyWith(color: kWhiteColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 316,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const MarathonHomeItem();
                    },
                  ),
                ),
              ],
            ),
          ),
          //Marathons
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).marathon_chapter_title3,
                        style: kHeadline5.copyWith(color: kWhiteColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 316,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const MarathonHomeItem();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
