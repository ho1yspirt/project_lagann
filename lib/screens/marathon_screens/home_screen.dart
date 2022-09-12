import 'package:flutter/material.dart';
import 'package:project_lagann/models/marathon.dart';
import 'package:project_lagann/screens/marathon_screens/see_all_screen.dart';
import 'package:project_lagann/widgets/card_widgets/marathon_item_card.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_sliver_box_link.dart';
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
      //TODO: change sizedbox to adaptive widget
      height: 325,
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
                CustomSliverBoxLink(
                  navigateTo: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SeeAllScreen(
                          _listParticipation,
                          S.of(context).marathon_chapter_title1,
                        ),
                      ),
                    );
                  },
                  title: S.of(context).marathon_chapter_title1,
                ),
                _buildItem(_listParticipation),
              ],
            ),
          ),
          //Signed
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomSliverBoxLink(
                  navigateTo: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SeeAllScreen(
                          _listSigned,
                          S.of(context).marathon_chapter_title2,
                        ),
                      ),
                    );
                  },
                  title: S.of(context).marathon_chapter_title2,
                ),
                _buildItem(_listSigned),
              ],
            ),
          ),
          //Marathons
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomSliverBoxLink(
                  navigateTo: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SeeAllScreen(
                          _listMarathons,
                          S.of(context).marathon_chapter_title3,
                        ),
                      ),
                    );
                  },
                  title: S.of(context).marathon_chapter_title3,
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
