import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/index.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Confirmation extends StatefulWidget {
  static const String id = 'Confirmation';
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final TextEditingController _confirmationController = TextEditingController();

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
        backgroundColor: Colors.white,
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
                    'Confirmation',
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
                          'Input your pin',
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
                        const SizedBox(height: 80),
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
                                Navigator.pushNamed(context, Index.id);
                              },
                              child: const Text(
                                'Verify & Proceed',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Public Sans',
                                    fontSize: 14
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24,),

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
          controller: _confirmationController,
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

}
