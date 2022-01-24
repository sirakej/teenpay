import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/fund_wallet.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/UI/welcome/onboarding.dart';
import 'package:stripling_wallet/UI/welcome/registration/forgot_password/sent_instructions.dart';
import 'package:stripling_wallet/UI/welcome/registration/login.dart';
import 'package:stripling_wallet/utils/themes.dart';
import 'UI/welcome/registration/dependats_registration/authentication.dart';
import 'UI/welcome/identification.dart';
import 'UI/welcome/registration/forgot_password/create_new_password.dart';
import 'UI/welcome/registration/forgot_password/reset_password.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/create_pin.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up_continue.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/otp.dart';
import 'UI/welcome/splashscreen.dart';

void main() {
  // Make application portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Stripling Wallet',
      theme: MyThemes.lightTheme,
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/OnBoarding': (context) => const OnBoarding(),
        '/authentication': (context) => const Authentication(),
        '/identification': (context) => const Identification(),
        Login.id:(context) => const Login(),
        GuardianSignUp.id:(context) => const GuardianSignUp(),
        GuardianSignUpContinue.id:(context) => const GuardianSignUpContinue(),
        OTP.id:(context) => const OTP(),
        CreatePin.id:(context) => const CreatePin(),
        ResetPassword.id:(context) => const ResetPassword(),
        SendInstructions.id:(context) => const SendInstructions(),
        CreateNewPassword.id:(context) => const CreateNewPassword(),
        IndexGuardian.id:(context) => const IndexGuardian(),
        FundsWallet.id:(context)=> const FundsWallet(),
        MyDependants.id:(context)=> const MyDependants(),
      },
    );
  }
}
