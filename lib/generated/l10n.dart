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

  /// `Cancel`
  String get action_cancel {
    return Intl.message(
      'Cancel',
      name: 'action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get action_apply {
    return Intl.message(
      'Apply',
      name: 'action_apply',
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

  /// `Reviews`
  String get action_reviews {
    return Intl.message(
      'Reviews',
      name: 'action_reviews',
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

  /// `Clear all`
  String get action_clear_all {
    return Intl.message(
      'Clear all',
      name: 'action_clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get action_search {
    return Intl.message(
      'Search',
      name: 'action_search',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get action_subscribe {
    return Intl.message(
      'Subscribe',
      name: 'action_subscribe',
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

  /// `Not interested`
  String get action_notinterested {
    return Intl.message(
      'Not interested',
      name: 'action_notinterested',
      desc: '',
      args: [],
    );
  }

  /// `Search history`
  String get search_screen_search_history {
    return Intl.message(
      'Search history',
      name: 'search_screen_search_history',
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

  /// `Subscribers`
  String get count_subscribers {
    return Intl.message(
      'Subscribers',
      name: 'count_subscribers',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get count_posts {
    return Intl.message(
      'Posts',
      name: 'count_posts',
      desc: '',
      args: [],
    );
  }

  /// `Search filter`
  String get search_filter {
    return Intl.message(
      'Search filter',
      name: 'search_filter',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get search_filter_sort_by {
    return Intl.message(
      'Sort by',
      name: 'search_filter_sort_by',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get search_filter_activity {
    return Intl.message(
      'Activity',
      name: 'search_filter_activity',
      desc: '',
      args: [],
    );
  }

  /// `Accent`
  String get search_filter_accent {
    return Intl.message(
      'Accent',
      name: 'search_filter_accent',
      desc: '',
      args: [],
    );
  }

  /// `Relevance`
  String get search_filter_relevance {
    return Intl.message(
      'Relevance',
      name: 'search_filter_relevance',
      desc: '',
      args: [],
    );
  }

  /// `Popularity`
  String get search_filter_popularity {
    return Intl.message(
      'Popularity',
      name: 'search_filter_popularity',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get search_filter_like {
    return Intl.message(
      'Like',
      name: 'search_filter_like',
      desc: '',
      args: [],
    );
  }

  /// `Upload date`
  String get search_filter_upload_date {
    return Intl.message(
      'Upload date',
      name: 'search_filter_upload_date',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get search_filter_user_name {
    return Intl.message(
      'User name',
      name: 'search_filter_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Channel name`
  String get search_filter_channel_name {
    return Intl.message(
      'Channel name',
      name: 'search_filter_channel_name',
      desc: '',
      args: [],
    );
  }

  /// `Signed`
  String get search_filter_signed {
    return Intl.message(
      'Signed',
      name: 'search_filter_signed',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get search_filter_friends {
    return Intl.message(
      'Friends',
      name: 'search_filter_friends',
      desc: '',
      args: [],
    );
  }

  /// `Liked`
  String get search_filter_liked {
    return Intl.message(
      'Liked',
      name: 'search_filter_liked',
      desc: '',
      args: [],
    );
  }

  /// `Viewed`
  String get search_filter_viewed {
    return Intl.message(
      'Viewed',
      name: 'search_filter_viewed',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get search_filter_none {
    return Intl.message(
      'None',
      name: 'search_filter_none',
      desc: '',
      args: [],
    );
  }

  /// `Anytime`
  String get date_anytime {
    return Intl.message(
      'Anytime',
      name: 'date_anytime',
      desc: '',
      args: [],
    );
  }

  /// `Last hour`
  String get date_last_hour {
    return Intl.message(
      'Last hour',
      name: 'date_last_hour',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get date_today {
    return Intl.message(
      'Today',
      name: 'date_today',
      desc: '',
      args: [],
    );
  }

  /// `This week`
  String get date_this_week {
    return Intl.message(
      'This week',
      name: 'date_this_week',
      desc: '',
      args: [],
    );
  }

  /// `This month`
  String get date_this_month {
    return Intl.message(
      'This month',
      name: 'date_this_month',
      desc: '',
      args: [],
    );
  }

  /// `This year`
  String get date_this_year {
    return Intl.message(
      'This year',
      name: 'date_this_year',
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
