import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carpet/menu.dart';
import 'package:carpet/result_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'cammera_screen.dart';
import 'feature_screen.dart';
import 'service.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Carpet App',
    // home: CammeraScreen(_cameras),
    // home: FeatureScreen()
    initialRoute: '/',
    routes: {
      '/' : (context)=>MenuPage(),
      'image': (context)=>CammeraScreen(_cameras),
      'feature': (context)=>FeatureScreen(),
    },
  ));
}

