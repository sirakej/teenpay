import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/transactions.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/fund_wallet.dart';
import 'package:stripling_wallet/controller/wallet_controller.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class WalletGuardians extends StatefulWidget {
  const WalletGuardians({Key? key}) : super(key: key);

  @override
  _WalletGuardiansState createState() => _WalletGuardiansState();
}

class _WalletGuardiansState extends State<WalletGuardians> {
  final controller = Get.put(WalletController());
  String balance = "500,000.00";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(left: 16,right: 16),
          child:Column(
            children: [
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Wallet',
                    style:
                    TextStyle(
                        color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                  Image.asset("images/profile_image.png",width:29,height:29 ,fit: BoxFit.contain,),

                ],
              ),
              const SizedBox(height: 24,),
              Container(
                height: 128,
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF3068A4)
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      bottom: -10,
                      child: Image.asset("images/side.png",width: 52.95,height: 80.32,fit: BoxFit.contain,),
                    ),
                    Positioned(
                      left: 130,
                      bottom: -30,
                      child: Image.asset("images/bottom.png",width: 52.95,height: 80.32,fit: BoxFit.contain,),
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      padding: const EdgeInsets.only(top:29,bottom: 29),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            const Text(
                              'Available Balance',
                              style:
                              TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF)
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              controller.see.value == false?'NGN ${controller.dynamicUserDetails.value.account?.ledgerBalance}':"NGN ********",
                              style:
                              const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Color(0xFFFFFFFF)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      padding: const EdgeInsets.only(top: 25,right: 27),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.see.value =!controller.see.value;
                              setState(() {

                              });
                              },
                            child: Container(
                              height: 27,
                              width: 36,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(image:AssetImage("images/ellipse.png") )
                              ),
                              child: controller.see.value==false?const Icon(Icons.visibility_off_outlined,color: Colors.white,):
                              const Icon(Icons.visibility_outlined,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, FundsWallet.id);
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
                        'Fund Wallet',
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    'Transactions',
                    style:
                    TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, Transactions.id);
                    },
                    child: const Text(
                      'View all',
                      style:
                      TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFF3068A4)
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24,),
                      transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Cancelled","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Cancelled","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
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
  transactionContainer(String status,String name, String time,String day,String money){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            status == "Successful"? Container(
              height: 32,
              width: 32,
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF18873D).withOpacity(0.1)
              ),
              child: Center(
                child: Image.asset("images/successful.png",width: 18,height: 10.41,fit: BoxFit.contain,),
              ),
            ):
            Container(
              height: 32,
              width: 32,
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF313D).withOpacity(0.1)
              ),
              child: Center(
                child: Image.asset("images/fail.png",width: 18,height: 10.41,fit: BoxFit.contain,),
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                  ),
                ),
                const SizedBox(height: 9,),
                Text(
                  "$time . $day",
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: const Color(0xFF161616).withOpacity(0.5)
                  ),
                ),

              ],
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                money,
                style:
                 TextStyle(
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 9,),
              Text(
                  status,
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: status == "Pending"?const Color(0xFFC6720F):
                      status == "Successful"?const Color(0xFF18873D):
                      status == "Cancelled"?const Color(0xFFF55353):null
                  )
              ),

            ],
          ),
        ),
      ],
    );
  }

}
