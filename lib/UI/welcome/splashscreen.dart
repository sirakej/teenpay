import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/welcome/new_onboarding.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        Navigator.pushNamed(context, NewBoarding.id);
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const Onboarding()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('images/splash_log.png',width:362, height:88, fit: BoxFit.contain,)),
    );
  }
}
