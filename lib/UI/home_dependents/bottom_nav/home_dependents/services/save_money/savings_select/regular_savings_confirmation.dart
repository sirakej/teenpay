import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/save_money.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class RegularSavingsConfirmation extends StatefulWidget {
  static const String id = 'RegularSavingsConfirmation';
  const RegularSavingsConfirmation({Key? key}) : super(key: key);

  @override
  _RegularSavingsConfirmationState createState() => _RegularSavingsConfirmationState();
}

class _RegularSavingsConfirmationState extends State<RegularSavingsConfirmation> {

  String placeHolder = "";

  bool terms = false;
  bool legal = false;

  void change(String given){
    setState((){
      placeHolder =given;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
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
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Regular Savings',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height: 75,),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'I authorize TeenPay to keep my [Amount to\nlock] immediately and return it in full on\n[payback date and time] to my TeenPay\nWallet. I confirm and approve this\ntransaction',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF161616)
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: terms,
                            activeColor: const Color(0xFF3068A4),
                            onChanged: (state){
                              terms = state;
                              setState(() {

                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        children:[
                          const Expanded(
                            child: Text(
                              'I hereby agree that my regular savings can\nbe broken at any given time’',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF161616)
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: legal,
                            activeColor: const Color(0xFF3068A4),
                            onChanged: (state){
                              legal = state;
                              setState(() {

                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      MaterialButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return const SaveMoney(populate:true);}));
                        },
                        child: Container(
                          width: 302,
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
                              'Create Fixed Savings',
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48,),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
