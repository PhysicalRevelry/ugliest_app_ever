import 'package:flutter/material.dart';
import 'package:ugliest_app_ever/state/navigation.dart';
import 'screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationState(),
        ),
      ],
      child: MaterialApp(
        routes: {},
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(),
      ),
    );
  }
}

