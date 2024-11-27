import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.red),
            title: const Text('Language'),
            onTap: () {
              // Handle language setting
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Language'),
                  content: Text('Select your preferred language'),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.red),
            title: const Text('Notifications'),
            onTap: () {
              // Handle notifications setting
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications Settings Tapped')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.red),
            title: const Text('Privacy'),
            onTap: () {
              // Handle privacy setting
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Privacy'),
                  content: Text('Manage your privacy settings here.'),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.red),
            title: const Text('Help'),
            onTap: () {
              // Handle help setting
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help Tapped')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged out')),
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
