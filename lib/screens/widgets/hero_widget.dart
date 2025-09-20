import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  const HeroWidget({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1920 / 1080,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return widget;
                },
              ),
            );
          },
          child: Stack(
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
          ),
        ),
      ),
    );
  }
}
