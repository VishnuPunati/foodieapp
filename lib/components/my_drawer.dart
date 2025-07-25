import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_drawer_tile.dart';
import 'package:fooddelivery/pages/login_page.dart';
import 'package:fooddelivery/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),

          // home list tile
          MyDrawerTile(
            title: 'H O M E',
            icon: Icons.home,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),

          // settings list tile
          MyDrawerTile(
            title: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),

          Spacer(),

          // logout list tile
          MyDrawerTile(
            title: 'L O G O U T',
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(onTap: () {}),
                ),
              );
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
