import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'log_in_pin.dart';

class DependantsPin extends StatefulWidget {
  static const String id = 'DependantsPin';
  const DependantsPin({Key? key}) : super(key: key);

  @override
  _DependantsPinState createState() => _DependantsPinState();
}

class _DependantsPinState extends State<DependantsPin> {
  final TextEditingController _otpController = TextEditingController();

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
                const SizedBox(height: 24,),
                const Padding(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                    'Authentication',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616),
                    ),
                  ),
                ),
                const SizedBox(height: 78,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Kindly enter the OTP sent to the phone number\nyou provided for validation purposes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF161616),
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildForm(),
                        const SizedBox(height: 50),
                        const Text(
                          'Enter OTP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF161616),
                          ),
                        ),
                        const SizedBox(height: 80),
                        MaterialButton(
                          onPressed: _ShowModalSheet,
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
                                'Verify & Proceed',
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Didn’t get OTP?? ',
                                style: Theme.of(context).textTheme.subtitle1
                            ),
                            // Spacer(),
                            TextButton(
                              onPressed: () {  },
                              child: Text(
                                'Resend OTP',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                    color: const Color(0xFF3068A4),
                                    fontFamily: '',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14

                                ),
                              ),
                            )
                          ],
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
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.only(left: 36,right: 36),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          obscureText: true,
          obscuringCharacter: '●',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return "must not be less than 3";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.zero,
            fieldHeight: 50,
            fieldWidth: 48,
            activeFillColor: loginFormColor,
            inactiveFillColor: loginFormColor,
            selectedFillColor: loginFormColor,
            inactiveColor: darkGreenColor,
            activeColor: darkGreenColor,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          //errorAnimationController: errorController,
          controller: _otpController,
          keyboardType: TextInputType.number,
          // boxShadows: const [
          //   BoxShadow(
          //     offset: Offset(0, 1),
          //     color: Colors.black12,
          //     blurRadius: 10,
          //   )
          // ],
          onCompleted: (v) {
            print('Completed');
          },
          onChanged: (value) {
            setState(() => currentText = value);
          },
          beforeTextPaste: (text) {
            print('Allowing to paste $text');
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _ShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return Container(
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 22,),
                Center(
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000).withOpacity(0.62),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("images/X.png",width:24 ,height: 24,fit: BoxFit.contain,)
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),
                      const Text(
                        'Account Created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616),
                        ),
                      ),
                      const SizedBox(height:24,),
                      Container(
                        height: 54,
                        width: 54,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset("images/dependants.png", height: 54,width: 54,fit: BoxFit.contain,),
                        ),
                      ),
                      const SizedBox(height: 34,),
                      Padding(
                        padding: const EdgeInsets.only(left: 33,right: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF151920).withOpacity(0.32),
                              ),
                            ),
                            const Text(
                              'Oripeloye Timilehin',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF161616),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26.5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 33,right: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Guardian',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF151920).withOpacity(0.32),
                              ),
                            ),
                            const Text(
                              'Oripeloye Timilehin',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF161616),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 43.5,),
                      InkWell(
                        onTap:(){
                          Navigator.pushNamedAndRemoveUntil(context, LogInPin.id, (route) => false);
                        },
                        child:Container(
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
                              'Set Login PIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:82)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

}
