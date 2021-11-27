import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:stripling_wallet/home/landing.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/enums.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/welcome/components/form_label.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication auth = LocalAuthentication();
  // ignore: prefer_final_fields
  SupportState supportState = SupportState.unknown;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (supported) => setState(() => supported == true
              ? SupportState.supported
              : SupportState.unsupported),
        );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool obscurePassword = true;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(15, 22, 22, 22),
                        shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('images/Stripling wallet icon _1.png',
                            scale: 3),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormLabel(text: 'Email'),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return 'Please enter some text';
                                // }
                                return null;
                              },
                              decoration: MyConstants.formInputDecoration,
                            ),
                            SizedBox(height: 10.0),
                            FormLabel(text: 'Password'),
                            TextFormField(
                              obscureText: obscurePassword,
                              // keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return 'Please enter some text';
                                // }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  child: Icon(obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                ),
                                // focusColor: MyColors.primaryColor,
                                focusColor: Colors.green,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MyColors.primaryColor, width: 1),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Forgot Password? ',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: MyConstants.primaryBorderRadius,
                                  gradient: MyColors.primaryLinearGradient,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Landing(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  // Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      print(
                                          'take the user to the register page');
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Login()),
                                      // );
                                    },
                                    child: Text(
                                      'Register',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            color: const Color(0xFF3068A4),
                                          ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        biometricsIcon(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  biometricsIcon() {
    if (supportState == SupportState.supported) {
      return Icon(
        Icons.fingerprint,
        size: 40,
      );
    } else {
      print('this device is not supported');
      return Container();
    }
  }
}
