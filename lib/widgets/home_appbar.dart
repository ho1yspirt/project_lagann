// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// import '../screens/followed_screens.dart';
// import '../screens/marathons_screen.dart';
// import '../screens/notifications_screen.dart';
// import '../screens/search_screen.dart';
// import '../utils/constants.dart';

// class HomeAppBar extends AppBar {
//   HomeAppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//         // Custom AppBar
//         Row(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               child: const Text('Marathons'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   // PageRouteBuilder(
//                   //   pageBuilder: (c, a1, a2) => MarathonsScreen(),
//                   //   transitionsBuilder: (c, anim, a2, child) =>
//                   //       FadeTransition(opacity: anim, child: child),
//                   //   transitionDuration: Duration(milliseconds: 2000),
//                   // ),
//                   MaterialPageRoute(
//                     builder: (context) => MarathonsScreen(),
//                   ),
//                 );
//               },
//             ),
//             kSeporatorLine,
//             GestureDetector(
//               child: const Text('Followed'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FollowedScreen(),
//                   ),
//                 );
//               },
//             ),
//             kSeporatorLine,
//             GestureDetector(
//               child: const Text('All'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NotificationsScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SearchScreen(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Ionicons.search)),
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => NotificationsScreen(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Ionicons.notifications)),
//           ],
//         ),
//       ],
//     );
//   }
// }
