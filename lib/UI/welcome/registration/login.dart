import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/UI/welcome/registration/forgot_password/reset_password.dart';
import 'package:stripling_wallet/UI/welcome/registration/login.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _emailController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _confirmPinController = TextEditingController();

  /// A boolean variable to hold whether the password should be shown or hidden
  bool _obscureTextLogin = true;

  String currentText = '';

  final formKey = GlobalKey<FormState>();
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
                    'Login to TeenPay',
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
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        _buildForm(),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 263,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: MyConstants.primaryBorderRadius,
                              gradient: MyColors.primaryLinearGradient,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, IndexGuardian.id);
                              },
                              child: const Text(
                                'Login',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'Public Sans'
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14,),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, ResetPassword.id);
                          },
                          child: const Text(
                            'Forgot Password',
                            style:
                            TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                              color:Color(0xFF161616),
                            ),
                          ),
                        )
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

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                  decoration: MyConstants.formInputDecoration,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
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
                    controller: _confirmPinController,
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
