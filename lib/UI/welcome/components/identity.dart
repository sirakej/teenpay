import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/utils/constants.dart';

class Identity extends StatelessWidget {
  const Identity({Key? key, required this.identifier, required this.imageroute})
      : super(key: key);
  final String imageroute;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 94,
          width: 102,
          child: Card(
            color: Get.isDarkMode?const Color(0xFF211F32):const Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Image.asset(imageroute,width:53,height:53,fit: BoxFit.contain,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            identifier,
            style:TextStyle(
                color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                fontWeight: FontWeight.w600,
                fontFamily: 'Public Sans',
                fontSize: 16
            ),
          ),
        )
      ],
    );
  }
}
