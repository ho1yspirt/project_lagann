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
  String get bottom_navbar_home {
    return Intl.message(
      'Home',
      name: 'bottom_navbar_home',
      desc: '',
      args: [],
    );
  }

  /// `PRO Video`
  String get bottom_navbar_pro_video {
    return Intl.message(
      'PRO Video',
      name: 'bottom_navbar_pro_video',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get bottom_navbar_courses {
    return Intl.message(
      'Courses',
      name: 'bottom_navbar_courses',
      desc: '',
      args: [],
    );
  }

  /// `Marathons`
  String get bottom_navbar_marathons {
    return Intl.message(
      'Marathons',
      name: 'bottom_navbar_marathons',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_navbar_profile {
    return Intl.message(
      'Profile',
      name: 'bottom_navbar_profile',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get settings_message_share {
    return Intl.message(
      'Share',
      name: 'settings_message_share',
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
