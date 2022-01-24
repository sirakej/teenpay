import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/components/buttons.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'components/onboardingcontent.dart';

class OnBoard {
  String title;
  String description;
  String image;
  OnBoard(this.title, this.description, this.image);
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with SingleTickerProviderStateMixin{
 // late AnimationController _animationController;
 // late Animation<double> _nextPage;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  bool end = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (v) {
      if (_currentPage == 2) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }

      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );

    });

  }
  @override
  Widget build(BuildContext context) {
    var contents = retrieveOnBoardingData();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child:PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  physics:const BouncingScrollPhysics(),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
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

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      width: _currentPage == index ? 25 : 6,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        gradient: LinearGradient(
          colors: _currentPage == index
              ? const [Color(0xFF335491), Color(0xFF1F8BB6)]
              : const [Color(0xFFCED8DC), Color(0xFFCED8DC)],
        ),
      ),
    );
  }
  List<OnBoard> retrieveOnBoardingData() {
    List<OnBoard> onboardingData = [];
    onboardingData.add(OnBoard(
        'Quick Transfer',
        'Transfer and make quick online payment to banks and other financial institutions',
        'images/rafiki1.png'));

    onboardingData.add(OnBoard(
        'Very Safe', 'Kidsave, a savings app forkids', 'images/rafiki2.png'));

    onboardingData.add(OnBoard('Digital Wallet',
        'Kidsave, a savings app forkids', 'images/rafiki3.png'));
    return onboardingData;
  }

  //end animation after leaving page
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _pageController.dispose();
  }
}
