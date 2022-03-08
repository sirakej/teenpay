import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import '../../login.dart';
import 'guardian_sign_up_continue.dart';


class GuardianSignUp extends StatefulWidget {
  static const String id = 'GuardianSignUp';
  const GuardianSignUp({Key? key}) : super(key: key);

  @override
  _GuardianSignUpState createState() => _GuardianSignUpState();
}

class _GuardianSignUpState extends State<GuardianSignUp> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _fullNameController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _emailController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _phoneNumberController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _passwordController = TextEditingController();

  /// A boolean variable to hold whether the password should be shown or hidden
  bool _obscureTextLogin = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF161616),
                      size: 39,
                    )
                ),
                Center(child: Image.asset("images/logo.png",width: 59.05,height:55.46 ,fit: BoxFit.contain,)),
                const SizedBox(height: 24.54),
                const Center(
                  child:Text(
                    'Sign Up to TeenPay',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF3068A4)
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(height: 30,),
                          Padding(
                            padding:const EdgeInsets.only(left: 16,right: 16),
                            child: _buildSignIn(),
                          ),
                          const SizedBox(height: 46,),
                          SizedBox(
                            width: 302,
                            height: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: MyConstants.primaryBorderRadius,
                                gradient: MyColors.primaryLinearGradient,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, GuardianSignUpContinue.id);
                                  }
                                },
                                child: const Text(
                                  'Next',
                                  style:
                                  TextStyle(
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, elevation: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontFamily: 'Public Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                  )
                              ),
                              // Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,Login.id);
                                },
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                    color: const Color(0xFF3068A4),
                                      fontFamily: 'Public Sans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    )
                )
              ],
            ),
          ),
        ),
      ),
      );
  }

  Widget _buildSignIn() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // full name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Public Sans',
                    color: Color(0xFF161616),
                  ),
                  decoration:MyConstants.formInputDecoration
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          //Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      if (value.length < 3 || !value.contains("@") || !value.contains(".")){
                        return 'Invalid email address';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          //phone number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Phone Number",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your phone number';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          //password
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    obscureText: _obscureTextLogin,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        suffixIcon: TextButton(
                          onPressed:_toggleLogin,
                          child:_obscureTextLogin ?
                          const Text(
                            "show",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ): const Text(
                            "Hide",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ),
                        )
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  /// A function to toggle if to show the password or not by
  /// changing [_obscureTextLogin] value
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

}
