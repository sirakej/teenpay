import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class PhysicalCard extends StatefulWidget {
  static const String id = 'PhysicalCard';
  const PhysicalCard({Key? key}) : super(key: key);

  @override
  _PhysicalCardState createState() => _PhysicalCardState();
}

class _PhysicalCardState extends State<PhysicalCard> {
  bool lockAccount = false;
  bool onlinePayment = false;
  bool atmWithdrawals = false;

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
               Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Physical Card',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(height: 80,),
                            Container(
                              padding: const EdgeInsets.only(left: 25,right: 13.5),
                              height: 210,
                              width: SizeConfig.screenWidth,
                              decoration: const BoxDecoration(
                                color: Color(0xFF161616),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("images/sim.png",width:41.25 ,height:31.5 ,fit: BoxFit.contain,),
                                  Image.asset("images/logo_white.png",width:64 ,height:60 ,fit: BoxFit.contain,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset("images/master_logo.png",width:36 ,height:28 ,fit: BoxFit.contain,),
                                      const SizedBox(height: 14,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 39,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonContainer("Online Payments", "Enable online payments with cards"),
                                CupertinoSwitch(
                                  value: onlinePayment,
                                  activeColor: const Color(0xFF3068A4),
                                  onChanged: (v){
                                    onlinePayment = v;
                                    setState(() {

                                    });
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 33,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonContainer("ATM Withdrawals", "Enable ATM  withdrawal with cards"),
                                CupertinoSwitch(
                                  value:  atmWithdrawals,
                                  activeColor: const Color(0xFF3068A4),
                                  onChanged: (v){
                                    atmWithdrawals = v;
                                    setState(() {

                                    });
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 33,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonContainer("Lock  Card", "Lock card temporarily" ),
                                CupertinoSwitch(
                                  value:  lockAccount,
                                  activeColor: const Color(0xFF3068A4),
                                  onChanged: (v){
                                    lockAccount = v;
                                    setState(() {

                                    });
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 33,),
                            activitiesContainer("Reset PIN", "Reset your card PIN")
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
  buttonContainer(String name, String explain){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
              const TextStyle(
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF161616)
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
  activitiesContainer(String name, String explain){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
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
                      color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
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
                      color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF161616).withOpacity(0.5)
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
