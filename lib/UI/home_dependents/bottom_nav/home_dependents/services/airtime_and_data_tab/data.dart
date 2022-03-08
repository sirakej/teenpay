import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class DataDependents extends StatefulWidget {
  static const String id = 'DataDependents';
  const DataDependents({Key? key}) : super(key: key);

  @override
  _DataDependentsState createState() => _DataDependentsState();
}

class _DataDependentsState extends State<DataDependents> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _amountController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _phoneNumberController = TextEditingController();

  String placeHolder = "";
  bool mobile = false;
  bool airtel= false;
  bool glo= false;
  bool mtn= false;

  void change(String given){
    setState((){
      placeHolder =given;
    });
  }

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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(height: 80,),
                        Padding(
                          padding:const EdgeInsets.only(left: 16,right: 16),
                          child: _buildAirtimeForm(),
                        ),
                        const SizedBox(height: 40,),
                        MaterialButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, DebitCard.id);
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
                                'Buy Data',
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
      ),
    );
  }

  Widget _buildAirtimeForm() {
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
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your amount';
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
                "Amount you want to buy",
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
                'Network',
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
              const SizedBox(height: 1,),
              Text(
                "Choose the network",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Phone Number",
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
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your amount';
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
                "Number you want to recharge",
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
                              'Network',
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
                                  airtel = true;
                                  mobile= false;
                                  glo= false;
                                  mtn= false;
                                  change("Airtel");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  airtel == false? Icon(
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
                                    'Airtel',
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
                                  airtel = false;
                                  mobile= true;
                                  glo= false;
                                  mtn= false;
                                  change("9mobile");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  mobile == false? Icon(
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
                                    '9mobile',
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
                                  airtel = false;
                                  mobile= false;
                                  glo= true;
                                  mtn= false;
                                  change("Glo");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  glo == false? Icon(
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
                                    'Glo',
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
                                  airtel = false;
                                  mobile= false;
                                  glo= false;
                                  mtn= true;
                                  change("MTN");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  mtn== false? Icon(
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
                                    'MTN',
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
