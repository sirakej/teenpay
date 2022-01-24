import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'otp.dart';


class GuardianSignUpContinue extends StatefulWidget {
  static const String id = 'GuardianSignUpContinue';
  const GuardianSignUpContinue({Key? key}) : super(key: key);

  @override
  _GuardianSignUpContinueState createState() => _GuardianSignUpContinueState();
}

class _GuardianSignUpContinueState extends State<GuardianSignUpContinue> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _referralController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _bankVerificationNumberController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _dateOfBirthController = TextEditingController();

  bool _terms = false;
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
                                    Navigator.pushNamed(context, OTP.id);
                                  },
                                  child: const Text(
                                    'Continue',
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
                                  onPressed: () {  },
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
          // referral
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Referral Code (optional)",
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
                    controller: _referralController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
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
          //BVN
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bank Verification Number(BVN)",
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
                    controller: _bankVerificationNumberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your ebvn';
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
          //dateOfBirth
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date of birth",
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
                    controller: _dateOfBirthController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your date of birth';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: _terms == false
                      ? const Icon(
                    Icons.check_box_outline_blank_outlined,
                    size: 25,
                    color:  Color(0xFF9097A5),
                  )
                      : const Icon(
                    Icons.check_box,
                    size: 25,
                    color:  Color(0xFF3068A4),
                  ),
                  onPressed: (){
                    setState(() {
                      _terms =! _terms;
                    });
                  }
              ),
              RichText(
                text:TextSpan(
                    text: "I agree to the ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Public Sans',
                      fontSize: 14,
                      color: Color(0xFF161616),
                    ),
                    children: [
                      TextSpan(
                        text: "Terms and Condition",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Public Sans',
                          fontSize: 12,
                          color: Color(0xFF3068A4),
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                         // Navigator.pushNamed(context, Terms.id);
                        },
                      ),
                    ]
                ),
                textAlign: TextAlign.start,
              )
            ],
          )
        ],
      ),
    );
  }
}
