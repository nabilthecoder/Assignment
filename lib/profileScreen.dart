// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'SignupPage.dart';
import 'homeScreen.dart';
import 'notificationscreen.dart';
import 'settingScreen.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  // ignore: use_key_in_widget_constructors
  const ProfileScreen({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile')),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: Text(userProfile.name),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(userProfile.email),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Username'),
            subtitle: Text(userProfile.username),
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Birthdate'),
            subtitle: Text(userProfile.birthdate ?? 'N/A'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Age'),
            subtitle: Text(userProfile.age?.toString() ?? 'N/A'),
          ),
        ],
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
              },
            ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(userProfile: userProfile),
                ),
              );
            } else if (index == 1) {
              // Already on Home screen
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
