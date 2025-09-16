import 'package:first_app/Data/constant.dart';
import 'package:first_app/Data/notifires.dart';
import 'package:first_app/screens/pages/welocme_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    showTheSavedTheme();
  }

  void showTheSavedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? theme = prefs.getBool(kConstants.kLightTheme);
    isDarkMode.value = theme ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode.value ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
