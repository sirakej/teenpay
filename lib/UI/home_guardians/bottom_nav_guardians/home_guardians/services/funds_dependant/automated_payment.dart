import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'automated_continue.dart';

class AutomatedPayment extends StatefulWidget {
  static const String id = 'AutomatedPayment';
  const AutomatedPayment({Key? key}) : super(key: key);

  @override
  _AutomatedPaymentState createState() => _AutomatedPaymentState();
}

class _AutomatedPaymentState extends State<AutomatedPayment> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _amountController = TextEditingController();

  bool weekly = false;
  bool monthly= false;
  bool biMonthly= false;
  bool quaterly= false;
  bool tobi = false;
  String placeHolder = "";
  String placeHolder_two = "";

  void change(String given){
    setState((){
      placeHolder =given;
    });
  }
  void changeDependants(String given){
    setState((){
      placeHolder_two =given;
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
          child:Column(
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
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Fund Dependants',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height:24),
              Center(
                child: Text(
                  'Create Automated payment\nfor  your Teens',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color:const Color(0xFF161616).withOpacity(0.8)
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              Expanded(
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 30,),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AutomatedPaymentContinue.id );
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
                              'Continue',
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // full name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Amount",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration
                ),
              ),
              const SizedBox(height: 1,),
              Text(
                "Amount you need from your parent/guardian",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: const Color(0xFF161616).withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frequency',
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
                onTap: _ShowModalSheet,
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
          const SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Dependant(s)',
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
                onTap: _ShowModalSheetDependent,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 5  )),
                        placeHolder_two.isEmpty?Container():Container(
                          width:78,
                          height:32,
                          color: const Color(0xFF3068A4).withOpacity(0.18),
                          child: Center(
                            child: Text(
                              // ignore: unnecessary_null_comparison, prefer_if_null_operators
                              placeHolder_two,
                              style:
                              const TextStyle(
                                  color: Color(0xFF161616),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                              ),
                            ),
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
          const SizedBox(height: 40),
        ],
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
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 2.73,),
                            const Text(
                              'Frequency of Payment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF161616),
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState((){
                                  weekly = true;
                                  monthly= false;
                                  biMonthly= false;
                                  quaterly= false;
                                  change("Weekly");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  weekly == false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Weekly',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  weekly = false;
                                  monthly= true;
                                  biMonthly= false;
                                  quaterly= false;
                                  change("Monthly");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  monthly == false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Monthly',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  weekly = false;
                                  monthly= false;
                                  biMonthly= true;
                                  quaterly= false;
                                  change("Bi-Monthly");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  biMonthly == false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Bi-Monthly',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap:  (){
                                setState(() {
                                  weekly = false;
                                  monthly= false;
                                  biMonthly= false;
                                  quaterly= true;
                                  change("Quaterly");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  quaterly== false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Quaterly',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height:33)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },

          );
        }
    );
  }
  _ShowModalSheetDependent(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 2.73,),
                            const Text(
                              'Dependants',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF161616),
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState((){
                                  tobi = true;
                                  changeDependants("Tobi Akanji");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  tobi == false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Tobi Akanji',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height:33)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },

          );
        }
    );
  }
}
