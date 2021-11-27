import 'package:flutter/material.dart';
import 'package:stripling_wallet/components/buttons.dart';

import 'components/onboardingcontent.dart';

class Rafiki {
  String title;
  String description;
  String image;
  Rafiki(this.title, this.description, this.image);
}

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var contents = retrieveOnBoardingData();

    AnimatedContainer buildDot({required int index}) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 5),
        width: currentPage == index ? 25 : 6,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          gradient: LinearGradient(
            colors: currentPage == index
                ? const [Color(0xFF335491), Color(0xFF1F8BB6)]
                : const [Color(0xFFCED8DC), Color(0xFFCED8DC)],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (context, index) => OnboardingContent(
                    title: contents[index].title,
                    description: contents[index].description,
                    image: contents[index].image,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          contents.length, (index) => buildDot(index: index)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: NavigatorButton(
                          route: '/identification', text: 'Get Started'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Rafiki> retrieveOnBoardingData() {
    List<Rafiki> onboardingData = [];
    onboardingData.add(Rafiki(
        'Quick Transfer',
        'Transfer and make quick online payment to banks and other financial institutions',
        'images/rafiki1.png'));

    onboardingData.add(Rafiki(
        'Very Safe', 'Kidsave, a savings app forkids', 'images/rafiki2.png'));

    onboardingData.add(Rafiki('Digital Wallet',
        'Kidsave, a savings app forkids', 'images/rafiki3.png'));
    return onboardingData;
  }
}
