import 'package:first_app/Data/notifires.dart';
import 'package:first_app/screens/pages/welocme_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/apple.jpg.webp'),
              ),
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () {
                selectedPage.value = 0;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
