import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugliest_app_ever/state/navigation.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<NavigationState>(
        builder: (context, navState, _) {
          return Center(
            child: navState.navBarScreens.elementAt(navState.selectedIndex),
          );
        }
      ),
      bottomNavigationBar: Consumer<NavigationState>(
        builder: (context, navState, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera',),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Google Map',),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About Me',),
            ],
            currentIndex: navState.selectedIndex,
            onTap: (index){
              navState.onItemTap(index);
            },
          );
        }
      ),
    ));
  }
}
