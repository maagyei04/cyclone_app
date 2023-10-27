import 'package:cyclone_v1/features/auth/presenter/screens/sign_up_screen.dart';
import 'package:cyclone_v1/features/onboarding/data/models/onboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnBoard> demoData = [
    OnBoard(
      image: 'assets/images/onboarding/2.png',
      title: 'Donate An Item',
      description: 'Help Us fight climate change problem. Every item you donate helps our fight',
    ),
    OnBoard(
      image: 'assets/images/onboarding/3.png',
      title: 'Request For An Item',
      description: 'Make a request for an item you will need and receive it in less than 24 hours from a colleague in your school',
    ),
    OnBoard(
      image: 'assets/images/onboarding/4.png',
      title: 'Earn Carbon Points',
      description: 'Earn carbon points for every item you share and receive. Points also go to the college\'s involvement in climate action.',
    ),
  ];

  late PageController _pageController;
  int _pageIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      if (_pageIndex < demoData.length - 1) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void goToNextPage() {
    if (_pageIndex < demoData.length - 1) {
      _pageIndex++;
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: demoData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    demoData[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        child: LinearProgressIndicator(
                          value: (_pageIndex + 1) / demoData.length,
                          minHeight: 8,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF398D1C)),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        demoData[index].title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 300,
                        child: Text(
                          demoData[index].description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                                            const SizedBox(height: 160),

                      // Button at the bottom
                    ],
                  ),
                ],
              );
            },
          ),
          const LongPressDraggable(feedback: Text("sample"),
          child: Text("sample")),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: goToNextPage,
              // ignore: avoid_print
              onLongPress: () {
                // ignore: avoid_print
                print("Long Press: $_pageIndex");
              },              child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                width: 335,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF398D1C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _pageIndex == 2 ? "Get Started" : "Next",
                    style: const TextStyle(
                      fontFamily: "HappyMonkey",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
