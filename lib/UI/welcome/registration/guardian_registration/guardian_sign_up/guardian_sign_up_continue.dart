import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stripling_wallet/UI/welcome/registration/login.dart';
import 'package:stripling_wallet/controller/on_board_controller.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class GuardianSignUpContinue extends StatefulWidget {
  static const String id = 'GuardianSignUpContinue';
  GuardianSignUpContinue({Key? key}) : super(key: key);
  final controller = Get.put(OnBoardController());


  @override
  _GuardianSignUpContinueState createState() => _GuardianSignUpContinueState();
}

class _GuardianSignUpContinueState extends State<GuardianSignUpContinue> {

  bool _terms = false;
  DateTime? _chosenDateTime;

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
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
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
                            MaterialButton(
                              onPressed: (){
                                _showDatePicker(context);
                                print(widget.controller.collectDateValue);
                              },
                              child: Container(
                                width:SizeConfig.screenWidth,
                                height: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color:Color(0xFFF3F5FC)
                                ),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _chosenDateTime==null?"":_chosenDateTime.toString()
                                  ),
                                ),
                              ),
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
                            ),
                            const SizedBox(height: 46,),
                            MaterialButton(
                              onPressed: () {
                                if (widget.controller.formKeyTwo.currentState!.validate()) {
                                  widget.controller.signUp();
                                }
                              },
                              child: Obx(()=>widget.controller.showSpinner.value ?
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
      key: widget.controller.formKeyTwo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // referral
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Referral Code (optional)",
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
                    controller: widget.controller.referralController,
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
             Text(
                "Bank Verification Number(BVN)",
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
                    controller: widget.controller.bankVerificationNumberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your bvn';
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
             Text(
                "Date of birth",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),

            ],
          ),

        ],
      ),
    );
  }

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 250,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    maximumYear: DateTime.now().year,
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                        widget.controller.collectDateValue.value = _chosenDateTime.toString();
                      });
                    }),
              ),
            ],
          ),
        ));
  }

}
