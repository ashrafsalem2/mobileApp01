import 'package:first_app/Data/constant.dart';
import 'package:first_app/Data/notifires.dart';
import 'package:first_app/screens/pages/home_page.dart';
import 'package:first_app/screens/pages/profile_page.dart';
import 'package:first_app/screens/pages/setting_page.dart';
import 'package:first_app/screens/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
        backgroundColor: Colors.black45,
        centerTitle: false,
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, value, child) {
              return IconButton(
                onPressed: () async {
                  isDarkMode.value = !isDarkMode.value;

                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(kConstants.kLightTheme, isDarkMode.value);
                },
                icon: isDarkMode.value
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingPage(title: 'Settings page');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPage,
        builder: (context, value, child) {
          return pages.elementAt(selectedPage.value);
        },
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
