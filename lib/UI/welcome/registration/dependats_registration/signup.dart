import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';

import '../../components/form_label.dart';
import '../login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    decoration: const BoxDecoration(
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
                        const Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FormLabel(text: 'Full Name'),
                          TextFormField(
                            validator: (value) {
                              // if (value == null || value.isEmpty) {
                              //   return 'Please enter some text';
                              // }
                              return null;
                            },
                            decoration: MyConstants.formInputDecoration,
                          ),
                          const SizedBox(height: 10.0),
                          const FormLabel(text: 'Email'),
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
                          const SizedBox(height: 10.0),
                          const FormLabel(text: 'Password'),
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
                              focusColor: MyColors.primaryColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.primaryColor, width: 1),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const FormLabel(text: 'Date Of Birth'),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              // if (value == null || value.isEmpty) {
                              //   return 'Please enter some text';
                              // }
                              return null;
                            },
                            decoration: MyConstants.formInputDecoration,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
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
                                      builder: (context) => const SignUp()),
                                );
                              }
                            },
                            child: const Text(
                              'Continue',
                              style:
                                  TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, elevation: 10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: Theme.of(context).textTheme.subtitle1),
                            // Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                              child: Text(
                                'Login',
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
        ),
      ),
    );
  }
}
