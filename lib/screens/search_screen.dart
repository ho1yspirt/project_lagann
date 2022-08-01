import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/search_controller.dart';

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
        actions: [
          TextButton(
            // TODO: implement method of searchcpntroller
            onPressed: () {},
            child: Text('Search'),
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
              leading: Icon(Ionicons.timer_outline),
              title: Text('Searched items'),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Ionicons.close_outline)),
            ),
          );
        },
      ),
    );
  }
}
