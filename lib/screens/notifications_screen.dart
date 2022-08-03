import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        title: const Text('Notifications'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Ionicons.create_outline))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (() {}),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                ),
                title: const Text('title text'),
                subtitle: SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('some subtitle action'),
                      kSeporatorDot,
                      const Text('5 hours ago'),
                    ],
                  ),
                ),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(
                      'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
