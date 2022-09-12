import 'package:flutter/material.dart';
import 'package:project_lagann/models/marathon.dart';
import 'package:project_lagann/widgets/widgets.dart';

import '../../generated/l10n.dart';
import '../../widgets/card_widgets/marathon_item_card.dart';

class SeeAllScreen extends StatelessWidget {
  final List<MarathonModel> listOfMarathons;
  final String title;
  const SeeAllScreen(this.listOfMarathons, this.title, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SlivAppBar(
            title: title,
            isNeedGoBack: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listOfMarathons.length,
                        itemBuilder: (context, index) {
                          MarathonModel marathon = listOfMarathons[index];
                          return MarathonItemCard(
                            marathonModel: marathon,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
