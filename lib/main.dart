import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_lagann/controllers/feedback_controller.dart';
import 'package:project_lagann/controllers/short_video_controller.dart';
import 'package:project_lagann/screens/root_screen.dart';
import 'package:project_lagann/utils/theme.dart';
// localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'controllers/comments_controller.dart';
import 'controllers/video_controller.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    // initUniLinks();
  }

  @override
  void dispose() {
    super.dispose();
    // _sub.cancel();
  }

  // Future<void> initUniLinks() async {
  //   _sub = linkStream.listen((String? link) {
  //     if (link != null) {
  //       print("Listener working");
  //       var uri = Uri.parse(link);
  //       print(link);
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => VideoScreen(
  //             videoModel: VideoModel(
  //               id: "1",
  //               author: const UserModel(
  //                 id: 1,
  //                 username: "cnsocd",
  //                 profileImageUrl:
  //                     "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
  //                 subscribers: "200",
  //               ),
  //               title: "Weather App UI Design in Figma - Full course",
  //               thumbnailUrl:
  //                   "https://thumbs.dreamstime.com/b/d-mural-wallpaper-beautiful-view-landscape-background-old-arches-tree-sun-water-birds-flowers-transparent-curtains-166191190.jpg",
  //               videoUrl: uri.query,
  //               duration: "20",
  //               timestamp: DateTime(2021, 7, 15),
  //               viewCount: "8K",
  //               likes: "4775",
  //               dislikes: "177",
  //               commentsCount: "250",
  //               description: " cbjiadvbdVNsdlvnlsv VadvbyayVDBanvv vaVAVbs",
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   }, onError: (err) {});
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommentsController()),
        ChangeNotifierProvider(create: (context) => VideoController()),
        ChangeNotifierProvider(create: (context) => FeedbakcController()),
        ChangeNotifierProvider(create: (context) => ShortVideoController()),
      ],
      child: MaterialApp(
        // themes
        theme: kBasicTheme(),
        // debug banner
        debugShowCheckedModeBanner: false,
        // localization
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const RootScreen(),
      ),
    );
  }
}
