import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/upgrade_account.dart';
import 'package:stripling_wallet/controller/profile_controller.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class AccountLimit extends StatefulWidget {
  static const String id = 'AccountLimit';
  const AccountLimit({Key? key}) : super(key: key);

  @override
  _AccountLimitState createState() => _AccountLimitState();
}

class _AccountLimitState extends State<AccountLimit> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _userIdController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _fullNameController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _phoneNumberController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _emailAddressController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _dateOfBirthController = TextEditingController();

  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    size: 39,
                  )
              ),
              const SizedBox(height: 5,),
             Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Text(
                  'Profile',
                  style:
                  TextStyle(
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                      fontFamily: 'Public sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 24
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 85,
                  width: 80,
                  child: Stack(
                    children: [
                      Container(
                        height: 87,
                        width: 87,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF00A69D).withOpacity(0.91),
                            ),
                            image: const DecorationImage(image:AssetImage("images/Selfie.png") ),
                            shape: BoxShape.circle
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell
                          (
                            onTap: (){},
                            child: Container(
                              height: 24.86,
                              width: 24.86,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF3068A4)
                              ),
                                child: Center(child: Image.asset("images/cam.png",fit:BoxFit.contain,height: 12,width:12,)))),
                    )
                  ],
                ),
              ),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Clipboard.setData(const ClipboardData(text:"CD123334u4")).then((_){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("ID copied to clipboard")));
                      });
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(
                          'Account Number:',
                          style:
                          TextStyle(
                              color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              fontFamily: 'Public sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                        ),
                        const SizedBox(width: 1,),
                        Text(
                          '253736292',
                          style:
                          TextStyle(
                              color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              fontFamily: 'Public sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                        ),
                        const SizedBox(width:16 ,),
                        Image.asset("images/Fra.png",width:13 ,height:13 ,fit: BoxFit.contain,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                   Text(
                    'Account Number:',
                    style:
                    TextStyle(
                        color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        fontFamily: 'Public sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    'Your account is limited to a balance of N50,000 and can not\nreceive a maximum deposit of N300,000 at a time',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(
                        color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.32),
                        fontFamily: 'Public sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, UpgradeAccount.id);
                    },
                    child: const Text(
                      'Upgrade Account',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(
                          color: Color(0xFF3068A4),
                          fontFamily: 'Public sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildForm(),
                      const SizedBox(height: 40,),
                      MaterialButton(
                        onPressed: () {

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
                              'Update',
                              style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                    ],
                  )
          ),
        ),
        ]
      ),
    )
      )
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // full name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
                "User ID",
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
                height: 50,
                child: TextFormField(
                    controller: _userIdController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                    style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        hintText: "${controller.dynamicUserDetails.value.account?.userId}",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily:'Public Sans' ,
                          color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8 ),

                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

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
                height: 50,
                child: TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        hintText: "${controller.dynamicUserDetails.value.firstname} ${controller.dynamicUserDetails.value.lastname} ",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily:'Public Sans' ,
                          color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8 ),

                        )
                    )
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
                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: 50,
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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        hintText: "${controller.dynamicUserDetails.value.phonenumber}",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily:'Public Sans' ,
                          color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8 ),

                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address",
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
                height: 50,
                child: TextFormField(
                    controller: _emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        hintText: "${controller.dynamicUserDetails.value.email}",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily:'Public Sans' ,
                          color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8 ),

                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date of Birth",
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
                height: 50,
                child: TextFormField(
                    controller: _dateOfBirthController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your date of birth';
                      }
                      return null;
                    },
                    style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                      hintText: "Dec 16, 199x",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily:'Public Sans' ,
                        color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8 ),

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

}
