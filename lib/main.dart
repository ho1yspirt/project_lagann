import 'package:flutter/material.dart';
import 'package:project_lagann/screens/root_screen.dart';
import 'package:project_lagann/utils/theme.dart';
// localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'controllers/comments_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommentsController())
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
