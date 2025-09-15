import 'package:first_app/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                  Lottie.asset('assets/lotties/Summer.json', height: 300,),
                  SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      "My App, where you find your space.",
                      style: TextStyle(
                        letterSpacing: 50,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
                        return LoginPage(title: "Login",);
                      },),(route) => false,);
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(height:5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(title:"Register")),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text("Register"),
                  ),
                  SizedBox(height:20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
