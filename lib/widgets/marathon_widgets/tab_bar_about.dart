import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/marathon_widgets/about_tab_item.dart';

class TabBarAbout extends StatefulWidget {
  const TabBarAbout({Key? key}) : super(key: key);

  @override
  State<TabBarAbout> createState() => _TabBarAboutState();
}

class _TabBarAboutState extends State<TabBarAbout> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About marathon",
                          style: kSubtitle1.copyWith(color: kWhiteColor),
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            _isVisible = !_isVisible;
                          }),
                          child: _isVisible
                              ? const Icon(Ionicons.chevron_up)
                              : const Icon(Ionicons.chevron_down),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: Text(
                        "The 3D path of the samurai begins with the first step and will always be difficult. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.",
                        style: kBody2TS.copyWith(color: kWhiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return AboutTabItem(index);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
