import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// TODO: create localize
// TODO: assign adaptive theme

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            // TODO: implement method of searchcpntroller
            // onFieldSubmitted: (value) => searchController.(value),
            ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        actions: [
          TextButton(
            // TODO: implement method of searchcpntroller
            onPressed: () {},
            child: const Text('Search'),
          ),
        ],
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
              title: const Text('Searched items'),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Ionicons.close_outline)),
            ),
          );
        },
      ),
    );
  }
}
