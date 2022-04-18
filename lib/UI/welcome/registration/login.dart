import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:stripling_wallet/UI/welcome/registration/forgot_password/reset_password.dart';
import 'package:stripling_wallet/controller/log_in_controller.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class Login extends StatefulWidget{
  static const String id = 'Login';

  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// A boolean variable to hold whether the password should be shown or hidden
  bool _obscureTextLogin = true;

  bool _showSpinner = false;

  String currentText = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                        MaterialButton(
                          onPressed:(){
                            controller.signIn();
                          },
                          child:Obx(()=>controller.showSpinner.value ?
                          const CircularProgressIndicator():
                          Container(
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
                                'Login',
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                          ),
                          )
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
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
                color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: SizeConfig.screenWidth,
              child: TextFormField(
                  controller: controller.emailController,
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
            Text(
              "Password",
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
                  obscureText: _obscureTextLogin,
                  controller: controller.passwordController,
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
                      suffixIcon:TextButton(
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
