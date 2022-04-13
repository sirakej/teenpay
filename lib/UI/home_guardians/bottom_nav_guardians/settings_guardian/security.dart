import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class Security extends StatefulWidget {
  static const String id = 'Security';
  const Security({Key? key}) : super(key: key);

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Security',
                  style:
                  TextStyle(
                      color:Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
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
                          onTap: (){},
                          child: buttonContainer("images/pin.png", "Transaction PIN", "View, update  your informations")
                      ),
                      const SizedBox(height: 30,),
                      InkWell(
                          onTap: (){},
                          child: buttonContainer("images/biometric.png", "Biometric Aunthentication", "View, update  your informations")
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  buttonContainer(String image, String name, String explain){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
        ),
        // ignore: avoid_unnecessary_containers
        const Icon(Icons.chevron_right_outlined,color: Color(0xFF323232),size: 18,)
      ],
    );
  }
}
