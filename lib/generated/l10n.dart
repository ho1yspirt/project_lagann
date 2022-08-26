// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `example text`
  String get example {
    return Intl.message(
      'example text',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navbar_home {
    return Intl.message(
      'Home',
      name: 'navbar_home',
      desc: '',
      args: [],
    );
  }

  /// `PROVideo`
  String get navbar_pro_video {
    return Intl.message(
      'PROVideo',
      name: 'navbar_pro_video',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get navbar_courses {
    return Intl.message(
      'Courses',
      name: 'navbar_courses',
      desc: '',
      args: [],
    );
  }

  /// `Marathons`
  String get navbar_marathons {
    return Intl.message(
      'Marathons',
      name: 'navbar_marathons',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navbar_profile {
    return Intl.message(
      'Profile',
      name: 'navbar_profile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get navbar_notifications {
    return Intl.message(
      'Notifications',
      name: 'navbar_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get action_comments {
    return Intl.message(
      'Comments',
      name: 'action_comments',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get action_likes {
    return Intl.message(
      'Likes',
      name: 'action_likes',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get action_share {
    return Intl.message(
      'Share',
      name: 'action_share',
      desc: '',
      args: [],
    );
  }

  /// `Not interested`
  String get action_notinterested {
    return Intl.message(
      'Not interested',
      name: 'action_notinterested',
      desc: '',
      args: [],
    );
  }

  /// `Don’t recommend this user's video`
  String get setteings_message_dont_recom {
    return Intl.message(
      'Don’t recommend this user\'s video',
      name: 'setteings_message_dont_recom',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get action_report {
    return Intl.message(
      'Report',
      name: 'action_report',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get action_save {
    return Intl.message(
      'Save',
      name: 'action_save',
      desc: '',
      args: [],
    );
  }

  /// `Signed`
  String get home_screen_signed {
    return Intl.message(
      'Signed',
      name: 'home_screen_signed',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get home_screen_all {
    return Intl.message(
      'All',
      name: 'home_screen_all',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description_title {
    return Intl.message(
      'Description',
      name: 'description_title',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get description_like {
    return Intl.message(
      'Likes',
      name: 'description_like',
      desc: '',
      args: [],
    );
  }

  /// `Dislikes`
  String get description_dislike {
    return Intl.message(
      'Dislikes',
      name: 'description_dislike',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get description_view {
    return Intl.message(
      'View',
      name: 'description_view',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get commetns_title {
    return Intl.message(
      'Comments',
      name: 'commetns_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel sending a comment`
  String get comments_save_title {
    return Intl.message(
      'Cancel sending a comment',
      name: 'comments_save_title',
      desc: '',
      args: [],
    );
  }

  /// `Top comments`
  String get comments_pop_up_item1 {
    return Intl.message(
      'Top comments',
      name: 'comments_pop_up_item1',
      desc: '',
      args: [],
    );
  }

  /// `New comments`
  String get comments_pop_up_item2 {
    return Intl.message(
      'New comments',
      name: 'comments_pop_up_item2',
      desc: '',
      args: [],
    );
  }

  /// `Old comments`
  String get comments_pop_up_item3 {
    return Intl.message(
      'Old comments',
      name: 'comments_pop_up_item3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
