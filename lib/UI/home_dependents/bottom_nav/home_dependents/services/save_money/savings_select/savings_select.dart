import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/regular_savings.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/target_savings.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'fixed_savings.dart';

class SavingsSelect extends StatefulWidget {

  static const String id = 'SavingsSelect';
  const SavingsSelect({
    Key? key,
  }) : super(key: key);

  @override
  _SavingsSelectState createState() => _SavingsSelectState();
}

class _SavingsSelectState extends State<SavingsSelect> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){

                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Savings',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context,RegularSavings.id);
                        },
                        child: selectContainer("Regular Savings", "Save your money and withdraw anytime you\nneed to", const Color(0xFFECD5A9), "images/regular_savings.png")
                      ),
                      const SizedBox(height: 24,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context,FixedSavings.id);
                          },
                          child: selectContainer("Fixed Savings", "Save your money and withdraw anytime you\nneed to", const Color(0xFFA9ECDC), "images/fixed_savings.png")
                      ),
                      const SizedBox(height: 24,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, TargetSavings.id);
                          },
                          child: selectContainer("Target Savings", "Save your money and withdraw anytime you\nneed to", const Color(0xFFECA9A9), "images/target_savings.png")
                      ),
                      const SizedBox(height: 24,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectContainer(String name, String details, Color color, String imageUrl){
    return Container(
      width: SizeConfig.screenWidth,
      height: 202,
      padding: const EdgeInsets.only(left: 24,right: 24),
      decoration:BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF161616)
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                details,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000)
                ),
              )
            ],
          ),
          Expanded(child: Image.asset(imageUrl,width:51,height: 51,fit: BoxFit.contain,))
        ],
      ),
    );
  }
}
