import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/search_screens/search_result_screen.dart';
import 'package:project_lagann/utils/constants.dart';
import '../../generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: TextFormField(
            controller: _textController,
            cursorColor: kPrimaryColor,
            cursorRadius: const Radius.circular(5),
            decoration: InputDecoration(
                hintText: S.of(context).action_search,
                suffixIcon: _textController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _textController.clear();
                          setState(() {});
                        },
                        child: const Icon(
                          Ionicons.close,
                          size: kIconSize8,
                          color: kWhiteColor,
                        ),
                      )
                    : null),
            onChanged: (text) {
              setState(() {});
            },
            // TODO: implement method of searchcpntroller
            // onFieldSubmitted: (value) => searchController.(value),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              // TODO: implement method of searchcpntroller
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchResultScreen(),
                  ),
                );
              },
              child: Text(
                S.of(context).action_search,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).search_screen_search_history,
                    style: kSubtitle1.copyWith(color: kWhiteColor),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        S.of(context).action_clear_all,
                        style: kBody1TS.copyWith(color: kGreyColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body:
          // searchController.searchedContent.isEmpty ?
          // Center(child: Text('Start searching your own story!')):
          ListView.builder(
        // itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (() {}),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Ionicons.timer_outline),
              title: Text(
                'фулл без смс и регистрации',
                style: kBody1TS.copyWith(color: kWhiteColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Ionicons.close_outline)),
            ),
          );
        },
      ),
    );
  }
}
