import 'package:challenge_tarea_one/screens/onboarding/intro_page_1.dart';
import 'package:challenge_tarea_one/screens/onboarding/intro_page_2.dart';
import 'package:challenge_tarea_one/screens/onboarding/intro_page_3.dart';
import 'package:challenge_tarea_one/screens/onboarding/intro_page_4.dart';
import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.90),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: const Text('saltar'),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 4),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HomePageAnimals();
                              }),
                            );
                          },
                          child: const Text('finalizar'),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text('siguiente'),
                        )
                ]),
          )
        ],
      ),
    );
  }
}
