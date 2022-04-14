import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stripling_wallet/UI/home_dependents/index.dart';
import 'package:stripling_wallet/controller/app_theme.dart';
import 'package:stripling_wallet/controller/theme_controller.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class Customization extends GetView<ThemeController>{
  static const String id = 'Customization';

  final themeController = Get.find<ThemeController>();
   bool dark = false;
   bool deviceSettings = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
        backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){},
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
                    'Customization',
                    style:
                    TextStyle(
                        color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        fontFamily: 'Public sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 33,),
                        InkWell(
                          onTap: (){
                            print(Get.isDarkMode);
                            if (Get.isDarkMode) {

                                themeController.changeTheme(Themes.lightTheme);
                                themeController.saveTheme(false);

                            } else {

                                themeController.changeTheme(Themes.darkTheme);
                                themeController.saveTheme(true);

                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonContainer("images/dark_mode.png", "Dark Mode", "View, update  your informations",),
                              // ignore: avoid_unnecessary_containers
//                          CupertinoSwitch(
//                            value: dark,
//                            activeColor: const Color(0xFF3068A4),
//                            onChanged: (state){
//                              dark = state;
//                              setState(() {
//
//                              });
//                            },
//                          )
                            ],
                          ),
                        ),
                       const SizedBox(height: 30,),
                        InkWell(
                            onTap: (){},
                            child: buttonContainer("images/device_settings.png", "Dark Settings", "View, update  your informations")
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  buttonContainer(String image, String name, String explain,){
    return Row(
      children: [
        Image.asset(image,width: 24,height: 24,fit: BoxFit.contain,),
        const SizedBox(width: 24,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
             TextStyle(
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
              ),
            ),
            const SizedBox(height: 9,),
            Text(
              explain,
              style:
              TextStyle(
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: const Color(0xFF161616).withOpacity(0.5)
              ),
            ),

          ],
        ),
      ],
    );
  }

}
