import 'package:first_app/Data/constant.dart';
import 'package:first_app/screens/pages/products_page.dart';
import 'package:first_app/screens/widgets/card_widget.dart';
import 'package:first_app/screens/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> values = [
      kValues.val1,
      kValues.val2,
      kValues.val3,
      kValues.val4,
    ];
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroWidget(title: "Home", widget: ProductsPage()),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
                child: Column(
                  children: List.generate(values.length, (index) {
                    return CardWidget(
                      title: values.elementAt(index),
                      description: "it the details of the card",
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
