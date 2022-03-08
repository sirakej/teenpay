import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/save_money.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class CreateFixedSavings extends StatefulWidget {
  static const String id = 'CreateFixedSavings';
  const CreateFixedSavings({Key? key}) : super(key: key);

  @override
  _CreateFixedSavingsState createState() => _CreateFixedSavingsState();
}

class _CreateFixedSavingsState extends State<CreateFixedSavings> {

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
                  'Fixed Savings',
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
                  padding: const EdgeInsets.only(left: 16,right:16 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Source of Fund',
                            style:
                            TextStyle(
                                color: Color(0xFF161616),
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: (){},
                            child: Container(
                                width: SizeConfig.screenWidth,
                                height: 50,
                                decoration:BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: const Color(0xFF151920).withOpacity(0.32)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Text(
                                      // ignore: unnecessary_null_comparison, prefer_if_null_operators
                                      placeHolder == null? "":placeHolder,
                                      style:
                                      const TextStyle(
                                          color: Color(0xFF161616),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: const Color(0xFF151920).withOpacity(0.32),
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'I hereby agree that I will forfeit the\ninterest accrued on this target savings if i\nfail to meet the target amount of\nN5000.00 by the set withdrawal date',
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
                              'I hereby agree to this: ‘if you break this\ntarget before the set withdrawal date, you\nwill lose all the interest accrued and bear\nthe 1% payment  geteway charge  for\nprocessing your deposits into this target’',
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
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
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),
                      const Text(
                        'Target Created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616),
                        ),
                      ),
                      const SizedBox(height:45,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF18873D).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 22,
                            color: Color(0xFF18873D),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28,),
                      Text(
                        'A target savings of #50,000 has been\ncreated for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF151920).withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 38,),
                      InkWell(
                        onTap:(){
                          // Navigator.pushNamed(context, Login.id);

                        },
                        child:Container(
                          width: 151,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.transparent,
                              border:Border.all(
                                  color: const Color(0xFF335491),
                                  width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Center(
                            child: Text(
                              'Done',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF335491),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:82)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}
