import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/controller/on_board_controller.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import '../../login.dart';
import 'guardian_sign_up_continue.dart';


class GuardianSignUp extends StatefulWidget {
  static const String id = 'GuardianSignUp';
  GuardianSignUp({Key? key}) : super(key: key);
  final controller = Get.put(OnBoardController());

  @override
  _GuardianSignUpState createState() => _GuardianSignUpState();
}

class _GuardianSignUpState extends State<GuardianSignUp> {

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
        backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){},
                    icon:Icon(
                      Icons.chevron_left,
                      color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                      size: 39,
                    )
                ),
                const SizedBox(height: 24),
                Padding (
                  padding:const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Getting Started',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Public Sans',
                            color:Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        'Create an account to continue!',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Public Sans',
                            color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        ),
                      ),
                    ],
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
                            child: _buildSignUp(),
                          ),
                          const SizedBox(height: 46,),
                          MaterialButton(
                            onPressed: () {
                              if (widget.controller.formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, GuardianSignUpContinue.id);
                              }
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
                                  'Next',
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                                ),
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

  Widget _buildSignUp() {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // full name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
                "Full Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                  controller: widget.controller.fullNameController,
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
              Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: widget.controller.emailController,
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
              Text(
                "Phone Number",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller:widget.controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                    ],
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
               Text(
                "Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    obscureText: _obscureTextLogin,
                    controller: widget.controller.passwordController,
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
                        suffixIcon: InkWell(
                            onTap: (){
                              if(!mounted)return;
                              setState(() => _obscureTextLogin = !_obscureTextLogin);
                            },
                            child: Icon(
                                _obscureTextLogin ? Icons.visibility_off : Icons.visibility,
                                color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack
                            )
                        ),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
