import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carpet/menu.dart';
import 'package:carpet/result_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'cammera_screen.dart';
import 'feature_screen.dart';
import 'service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale("en");

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  String getLocale(){
    return _locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('fa'),
        const Locale('ar'),// Spanish, no country code
        // ... other locales the app supports
      ],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      title: 'Carpet App',
      // home: CammeraScreen(_cameras),
      // home: FeatureScreen()
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPage(),
        'image': (context) => CammeraScreen(_cameras),
        'feature': (context) => FeatureScreen(),
      },
    );
  }
}

