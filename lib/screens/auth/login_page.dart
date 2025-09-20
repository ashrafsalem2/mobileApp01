import 'package:first_app/screens/pages/welocme_page.dart';
import 'package:first_app/screens/widget_tree.dart';
import 'package:first_app/screens/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String confirmedEmail = "123";
  String confirmedPassword = "456";

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return FractionallySizedBox(
              widthFactor: widthScreen > 500 ? 0.5 : 1.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeroWidget(title: widget.title, widget: WelcomePage()),
                        SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hint: Text("Email"),
                          ),
                          onEditingComplete: () {},
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hint: Text("Password"),
                          ),
                          onEditingComplete: () {},
                        ),
                        SizedBox(height: 20),
                        FilledButton(
                          onPressed: () {
                            onLogginPressed();
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                          ),

                          child: Text(widget.title),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // at before the last praces
  void onLogginPressed() {
    if (confirmedEmail == emailController.text &&
        confirmedPassword == passwordController.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
      );
    }
  }
}
