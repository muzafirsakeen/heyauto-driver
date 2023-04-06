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

  /// `Hi Welcome`
  String get welcometext {
    return Intl.message(
      'Hi Welcome',
      name: 'welcometext',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Language`
  String get chooselang {
    return Intl.message(
      'Choose Your Language',
      name: 'chooselang',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Welcome \nBack`
  String get welcomeback {
    return Intl.message(
      'Welcome \nBack',
      name: 'welcomeback',
      desc: '',
      args: [],
    );
  }

  /// `Create\n Account`
  String get createacc {
    return Intl.message(
      'Create\n Account',
      name: 'createacc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Credentials`
  String get invalidcredential {
    return Intl.message(
      'Invalid Credentials',
      name: 'invalidcredential',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get nexe {
    return Intl.message(
      'next',
      name: 'nexe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotpass {
    return Intl.message(
      'Forgot Password',
      name: 'forgotpass',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an Account?`
  String get donthaveacc {
    return Intl.message(
      'Dont have an Account?',
      name: 'donthaveacc',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyhave {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyhave',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and password`
  String get pleaseenterboth {
    return Intl.message(
      'Please enter your email and password',
      name: 'pleaseenterboth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseenteremail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseenteremail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Password`
  String get pleaseenterpass {
    return Intl.message(
      'Please enter your Password',
      name: 'pleaseenterpass',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the OTP`
  String get pleasefillotp {
    return Intl.message(
      'Please fill the OTP',
      name: 'pleasefillotp',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendotp {
    return Intl.message(
      'Resend OTP',
      name: 'resendotp',
      desc: '',
      args: [],
    );
  }

  /// `Not Received.?`
  String get Notrecieved {
    return Intl.message(
      'Not Received.?',
      name: 'Notrecieved',
      desc: '',
      args: [],
    );
  }

  /// `Back to SignUp`
  String get backsign {
    return Intl.message(
      'Back to SignUp',
      name: 'backsign',
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
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'ml'),
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
