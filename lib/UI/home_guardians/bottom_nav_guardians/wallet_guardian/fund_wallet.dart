import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/add_wallet/add_ussd.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/debit_card.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'add_wallet/add_bank_transfer.dart';

class FundsWallet extends StatefulWidget {
  static const String id = 'FundsWallet';
  const FundsWallet({Key? key}) : super(key: key);

  @override
  _FundsWalletState createState() => _FundsWalletState();
}

class _FundsWalletState extends State<FundsWallet> {
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
                  onPressed: (){},
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Text(
                  'Fund Wallet',
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
                      const SizedBox(height: 65,),
                      InkWell(
                        onTap: _ShowModalSheet,
                        child: fundsContainer("images/debit.png", "Debit Cards", "Fund your Stripling Wallet using Debit card")
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AddBankTransfer.id);
                        },
                        child: fundsContainer("images/bank.png", "Bank Trasfers", "Fund your Stripling Wallet using bank transfer"),
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AddUssd.id);
                        },
                        child: fundsContainer("images/ussd.png", "USSD", "Fund your Stripling Wallet using USSD"),
                      )
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
  fundsContainer(String image, String name, String explain){
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
  // ignore: non_constant_identifier_names
  _ShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return Container(
            width: SizeConfig.screenWidth,
            decoration:BoxDecoration(
              color:Get.isDarkMode?AppColors.darkBottomSheet:AppColors.lightBackground,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 22,),
                Center(
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000).withOpacity(0.62),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("images/X.png",width:24 ,height: 24,fit: BoxFit.contain,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22,right:22 ),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 2.73,),
                        Text(
                          'Debit Cards',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                          ),
                        ),
                        const SizedBox(height:45,),
                        Text(
                          'You can add add money into your account with local\nand foreign bank cards. Adding money with a Naira\ncard is free up to a total sum of N100,000.00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF151920).withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 22,),
                        Text(
                          'You will be charged immediately for adding money\nwith a foreign card',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF151920).withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 38,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Naira Card',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              ),
                            ),
                            Text(
                              'N100.00 +  1.5%  of Amount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(
                              'Foreign Card',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              ),
                            ),
                            Text(
                              'N100.00 +  4.0%  of Amount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color:Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, DebitCard.id);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth,
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
                                'Continue',
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:10)
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}
