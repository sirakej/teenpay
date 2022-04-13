import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_dependents/index.dart';
import 'package:stripling_wallet/UI/welcome/registration/dependats_registration/dependants_authentication.dart';
import 'package:stripling_wallet/UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'components/identity.dart';

class Identification extends StatelessWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
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
              const SizedBox(height: 24,),
              Container(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                      'Identification',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Public Sans',
                          color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Who are you?',
                      style: TextStyle(
                          fontFamily: 'Public Sans',
                          color: Color(0xFF3068A4),
                          fontSize: 36,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please select the right option that represents you',
                      style: TextStyle(
                          color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                          fontFamily: 'Public Sans',

                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, GuardianSignUp.id);
                          },
                          child: const Identity(
                            identifier: 'Guardian',
                            imageroute: 'images/parent_user.png',
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        TextButton(
                          onPressed: () {
                           // Navigator.pushNamed(context, Index.id);
                            Navigator.pushNamed(context, DependantsAuthentication.id);
                          },
                          child: const Identity(
                            identifier: 'Dependant',
                            imageroute: 'images/child_user.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
