import 'package:cashpilot_money_controller/constants/colors.dart';
import 'package:cashpilot_money_controller/constants/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboarding extends StatelessWidget {

  final String title;
  final String imagePath;
  final String description;

  const SharedOnboarding({super.key, required this.title, required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: kBlack
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kGray
            ),
          ),
        ],
      ),
    );
  }
}