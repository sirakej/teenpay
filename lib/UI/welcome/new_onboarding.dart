import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/welcome/components/onboardingItem.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class NewBoarding extends StatefulWidget {
  static const String id = 'NewBoarding';
  const NewBoarding({Key? key}) : super(key: key);

  @override
  _NewBoardingState createState() => _NewBoardingState();
}

class _NewBoardingState extends State<NewBoarding> {
  int currentOnboardingPage = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Center(
                child: CarouselSlider(
                  //carouselController: ,
                  options: CarouselOptions(
                    enableInfiniteScroll:true,
                    viewportFraction: 1,
                    scrollPhysics: const BouncingScrollPhysics(),
                    initialPage: 0,
                    height: SizeConfig.screenHeight!*0.56,
                    autoPlay: true,
                    autoPlayInterval: const Duration(milliseconds: 5000),
                    onPageChanged: (index, reason){
                      setState(() {
                        currentOnboardingPage = index;
                      });
                    }
                  ),
                  items: const [
//                    OnBoardingItem(
//                        lottiePath: 'assets/lottie/lf20_bklsz9ka.json',
//                        title: 'Quick transfer to dependant',
//                        body: 'You can make transfer to your dependants  by simply\nselecting the dependants'
//                    ),
                    OnBoardingItem(
                        lottiePath: 'assets/lottie/lf20_rsr8miag.json',
                        title: 'Quick transfer to dependant',
                        body: 'You can make transfer to your dependants  by simply\nselecting the dependants'
                    ),
                    OnBoardingItem(
                        lottiePath: 'assets/lottie/lf20_x0jdjppz.json',
                        title: 'Manage dependant accounts',
                        body: 'Add multiple dependants and manage their accounts\nto help and guide their financial decisions'
                    ),
                    OnBoardingItem(
                        lottiePath: 'assets/lottie/lf20_qgnwfjwn.json',
                        title: 'Cashless Convinience',
                        body: 'Let your dependant have first hand experience of a\ncashless society and a cashless economy'
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //Navigator.pushNamed(context, DebitCard.id);
                  Navigator.pushReplacementNamed(context, '/identification');
                },
                child: Container(
                  width: 302,
                  height: 50,
                  decoration:BoxDecoration(
                      gradient:LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0XFF1F8BB6).withOpacity(1),
                          const Color(0xFF335491).withOpacity(1),
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
