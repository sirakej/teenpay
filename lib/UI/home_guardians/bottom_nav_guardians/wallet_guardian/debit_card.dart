import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/add_wallet/add_debit_card.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class DebitCard extends StatefulWidget {
  static const String id = 'DebitCard';
  const DebitCard({Key? key}) : super(key: key);

  @override
  _DebitCardState createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){},
                  icon:Icon(
                    Icons.chevron_left,
                    color:Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    size: 39,
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Debit Card',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight!/5,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/empty_dependants.png",width: 156,height: 156,fit: BoxFit.contain,),
                    const SizedBox(height: 35.99,),
//                    const Text(
//                      'No Dependant has been added so far',
//                      style: TextStyle(
//                          fontSize: 12,
//                          fontFamily: 'Public Sans',
//                          fontWeight: FontWeight.w600,
//                          color: Color(0xFF3068A4)
//                      ),
//                    ),
//                    const SizedBox(height: 8,),
//                    const Text(
//                      'Kindly click on the button below to add your dependant\nor children',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontSize: 12,
//                          fontFamily: 'Public Sans',
//                          fontWeight: FontWeight.w400,
//                          color: Color(0xFF161616)
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: const Color(0xFF3068A4),
        child: const Icon(
          Icons.add,
          size: 16,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddDebitCard.id);
        },
      ),
    );
  }
}
