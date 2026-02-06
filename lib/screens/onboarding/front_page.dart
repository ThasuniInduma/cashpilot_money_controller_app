import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
          "assets/img5.png",
          width: 175,
          fit: BoxFit.cover,
        )
    );
  }
}