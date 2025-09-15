import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String title;
  const HeroWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Hero(
          tag: 'hero01',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage('assets/images/apple.jpg.webp'),
              fit: BoxFit.cover,
              color: Colors.teal.shade900,
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 50,
              letterSpacing: 50,
              color: Colors.white60,
            ),
          ),
        ),
      ],
    );
  }
}
