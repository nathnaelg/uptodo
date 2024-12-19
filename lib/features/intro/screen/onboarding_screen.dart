import 'package:flutter/material.dart';
import 'package:uptodo/features/intro/screen/start_screen.dart';
import '../../../shared/widget/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/png/illustration1.png",
      "title": "Manage your tasks",
      "subtitle":
          "You can easily manage all of your daily tasks in DoMe for free",
    },
    {
      "image": "assets/png/illustration2.png",
      "title": "Create daily routine",
      "subtitle":
          "In Uptodo you can create your personalized routine to stay productive",
    },
    {
      "image": "assets/png/illustration3.png",
      "title": "Organize your tasks",
      "subtitle":
          "You can organize your daily tasks by adding your tasks into separate categories",
    },
  ];

  void _onNextPressed() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartScreen()),
      );
    }
  }

  void _onBackPressed() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkipPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  final data = _onboardingData[index];
                  return OnboardingPage(
                    image: data["image"]!,
                    title: data["title"]!,
                    subtitle: data["subtitle"]!,
                    onSkipPressed: _onSkipPressed,
                  );
                },
              ),
            ),
            // Bottom Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  TextButton(
                    onPressed: _currentPage > 0 ? _onBackPressed : null,
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        color: _currentPage > 0
                            ? Colors.grey
                            : Colors.grey.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  // Next or Get Started Button
                  ElevatedButton(
                    onPressed: _onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? 'GET STARTED'
                          : 'NEXT',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
