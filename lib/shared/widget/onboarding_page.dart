import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onSkipPressed;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Skip Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: onSkipPressed,
              child: const Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        // Illustration
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Image.asset(
            image,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16.0),
        // Page Indicator
        const SizedBox(height: 24.0),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
