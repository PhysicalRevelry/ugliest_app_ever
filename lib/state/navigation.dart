import 'package:flutter/material.dart';
import 'package:ugliest_app_ever/screens/about.dart';
import 'package:ugliest_app_ever/screens/animations.dart';
import 'package:ugliest_app_ever/screens/camera.dart';
import 'package:ugliest_app_ever/screens/google_map.dart';
import 'package:ugliest_app_ever/screens/home_screen.dart';

class NavigationState extends ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> navBarScreens = <Widget>[
    Animations(),
    HomeScreen(),
    CameraScreen(),
    GoogleMap(),
    About(),
  ];

  void onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
