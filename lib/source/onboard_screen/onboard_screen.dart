import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  final pages = [Images.page1, Images.page2, Images.page3];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Image.asset(pages[index]);
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const WormEffect(dotHeight: 8, dotWidth: 8),
              ),
            ),
            const SizedBox(height: 80),
            Center(
              child: Text(
                'Easy to use',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Get ready to pay all your bills with just a few taps. Paying your bills became fast and efficient. Enjoy!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 75),
            CustomElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoute.loginScreen),
              buttonText: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
