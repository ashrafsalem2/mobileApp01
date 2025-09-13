import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
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
    );
  }
}
