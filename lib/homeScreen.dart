// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'SignupPage.dart';
import 'notificationscreen.dart';
import 'profileScreen.dart';
import 'settingScreen.dart';

class HomeScreen extends StatelessWidget {
  final UserProfile userProfile;

  // ignore: use_key_in_widget_constructors
  const HomeScreen({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: const Center(
        child: Text('Welcome to the Home screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userProfile.name),
              accountEmail: Text(userProfile.email),
              currentAccountPicture: CircleAvatar(
                child: Text(userProfile.name[0]),
              ),
            ),
            ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userProfile: userProfile),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NotificationsScreen(userProfile: userProfile),
                ),
              );
            }
          }),
    );
  }
}
