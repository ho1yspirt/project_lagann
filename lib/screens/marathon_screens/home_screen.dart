import 'package:flutter/material.dart';
import 'package:project_lagann/models/marathon.dart';
import 'package:project_lagann/screens/marathon_screens/see_all_screen.dart';
import 'package:project_lagann/widgets/card_widgets/marathon_item_card.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import '../../widgets/widgets.dart';

class MarathonHomeScreen extends StatefulWidget {
  const MarathonHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarathonHomeScreen> createState() => _MarathonHomeScreenState();
}

class _MarathonHomeScreenState extends State<MarathonHomeScreen> {
  final List<MarathonModel> _listMarathons = [
    MarathonModel(
      id: "1",
      name: "Как подать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      price: "100\$",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
    MarathonModel(
      id: "2",
      name: "Как подать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      price: "100\$",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
  ];

  final List<MarathonModel> _listSigned = [
    MarathonModel(
      id: "5",
      name: "Как подать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      stagesQantyti: "11/15",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
    MarathonModel(
      id: "6",
      name: "Как пhодать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      stagesQantyti: "13/15",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
  ];

  final List<MarathonModel> _listParticipation = [
    MarathonModel(
      id: "3",
      name: "Как подать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      participantsQantyti: "#100",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
    MarathonModel(
      id: "4",
      name: "Как подать гаш!",
      category: "3D Desing",
      createdAt: DateTime(2017, 08, 22),
      updatedAt: DateTime(2017, 08, 22),
      startDate: DateTime(2017, 09, 22),
      endDate: DateTime(2017, 12, 22),
      participantsQantyti: "#50",
      description:
          "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
      previewPhoto: [
        "https://images.unsplash.com/photo-1633118244244-45fa4104942f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
      ],
    ),
  ];

  Widget _buildItem(List<MarathonModel> marathonItems) {
    return SizedBox(
      height: 316,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          MarathonModel marathon = marathonItems[index];
          return MarathonItemCard(
            marathonModel: marathon,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  padding: const EdgeInsets.only(
                      left: 16, bottom: 14, right: 16, top: 6),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).marathon_chapter_title1,
                        style: kHeadline5.copyWith(color: kWhiteColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SeeAllScreen(
                                _listParticipation,
                                S.of(context).marathon_chapter_title1,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildItem(_listParticipation),
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SeeAllScreen(
                                _listSigned,
                                S.of(context).marathon_chapter_title2,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildItem(_listSigned),
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SeeAllScreen(
                                _listMarathons,
                                S.of(context).marathon_chapter_title3,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: kHeadline6.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildItem(_listMarathons),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
