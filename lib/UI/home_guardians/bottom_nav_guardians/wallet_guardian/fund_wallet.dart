import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(left: 16,right: 16),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              const Text(
                'Fund Wallet',
                style:
                TextStyle(
                    color: Color(0xFF161616),
                    fontFamily: 'Public sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 65,),
                      fundsContainer("images/debit.png", "Debit Cards", "Fund your Stripling Wallet using Debit card"),
                      const SizedBox(height: 33,),
                      fundsContainer("images/bank.png", "Bank Trasfers", "Fund your Stripling Wallet using bank transfer"),
                      const SizedBox(height: 33,),
                      fundsContainer("images/ussd.png", "USSD", "Fund your Stripling Wallet using USSD"),

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
        ),
        // ignore: avoid_unnecessary_containers
        const Icon(Icons.chevron_right_outlined,color: Color(0xFF323232),size: 18,)
      ],
    );
  }

}
