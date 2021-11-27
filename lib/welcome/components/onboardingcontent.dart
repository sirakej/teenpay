import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  final String title, description, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Image.asset(image),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3068A4),
          ),
        ),
        const SizedBox(height: 10),
        Text(description,
            style: const TextStyle(fontSize: 14), textAlign: TextAlign.center)
      ],
    );
  }
}
