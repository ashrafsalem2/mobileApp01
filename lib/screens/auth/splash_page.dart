import 'package:first_app/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lotties/run.json', height: 300),
                  SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      "Lets Join our app",
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage(title: "Register");
                          },
                        ),
                        (route) => false,
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text("Register"),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
