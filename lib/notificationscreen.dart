import 'package:flutter/material.dart';
import 'SignupPage.dart';
import 'homeScreen.dart';
import 'profileScreen.dart';
import 'settingScreen.dart';

class NotificationsScreen extends StatelessWidget {
  final UserProfile userProfile;

  // ignore: use_key_in_widget_constructors
  const NotificationsScreen({required this.userProfile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notifications')),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification 1'),
            subtitle: Text('This is the first notification'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification 2'),
            subtitle: Text('This is the second notification'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification 3'),
            subtitle: Text('This is the third notification'),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(userProfile: userProfile),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userProfile: userProfile),
                ),
              );
            } else if (index == 2) {}
          }),
    );
  }
}
