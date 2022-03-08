import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/request_money/new_request.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/send_money/confirmation_pin.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import '../new_request_link.dart';

class Others extends StatefulWidget {
  static const String id = 'Others';
  const Others({Key? key}) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _othersAmountController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _othersRequestTitleController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _othersDescriptionController = TextEditingController();

  bool status = false;
  bool monday = false;
  bool tuesday= false;
  bool wednesday= false;
  bool thursday= false;
  bool friday= false;
  bool saturday= false;
  bool sunday= false;
  bool beneficiary = false;
  String placeHolder = "";

  void change(String given){
    setState((){placeHolder =given;});
    print(placeHolder);
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
              const SizedBox(height:50),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/beneficiary.png", "Choose\nBeneficiary"),
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/dummy_2.png", "Temitope\nOjo"),
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/dummy_4.png", "Elijah\nKlaus"),
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/dummy_3.png", "James\nToluwabori"),
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/dummy_5.png", "Taiwo\nIpaye"),
                    const SizedBox(width: 16,),
                    beneficiaryContainer("images/dummy_2.png", "Precious\nAkala"),
                  ],
                ),
              ),
              const SizedBox(height: 38,),
              Expanded(
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 10,),
                      MaterialButton(
                        onPressed: _RequestConfirmShowModalSheet,
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
                              'Create Request',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Request Title",
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
                    keyboardType:TextInputType.text,
                    controller: _othersRequestTitleController,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
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
                    keyboardType:TextInputType.number,
                    controller: _othersAmountController,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
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
                    controller: _othersDescriptionController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    maxLines: null,
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
                    decoration:MyConstants.kTextBigFieldDecoration.copyWith(

                    )
                ),
              ),
              const SizedBox(height: 1,),
              Text(
                "Use a description that makes your parent understand your needs",
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
          const SizedBox(height: 25),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  beneficiaryContainer(String image,String name){
    return Column(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
              image: DecorationImage(image:AssetImage(image) ),
              shape: BoxShape.circle
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Public Sans',
              fontSize: 10,
              color: const Color(0xFF151920).withOpacity(0.8)
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  _RequestConfirmShowModalSheet(){
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
                      const Text(
                        'Request Confirmation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616),
                        ),
                      ),
                      const SizedBox(height:45,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recipient',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                const Text(
                                  'Akin Alabi Jnr.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width:SizeConfig.screenWidth,
                              color: const Color(0xFF161616).withOpacity(0.08),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                const Text(
                                  'N75,000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width: SizeConfig.screenWidth,
                              color: const Color(0xFF161616).withOpacity(0.08),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Desc',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                const Text(
                                  'Flex Money for Christmas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width: SizeConfig.screenWidth,
                              color: const Color(0xFF161616).withOpacity(0.08),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Charges',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                const Text(
                                  'N3.00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width: SizeConfig.screenWidth,
                              color: const Color(0xFF161616).withOpacity(0.08),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height:82),
                      Padding(
                        padding: const EdgeInsets.only(left: 36,right: 36),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.pop(context);
                            _AcceptShowModalSheet();
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
                                style: TextStyle(
                                    fontSize:14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:32),
                      TextButton(
                          onPressed: (){},
                          child: const Text(
                            'No, don’t Proceed',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF335491)
                            ),
                          )
                      ),
                      const SizedBox(height:42)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  _AcceptShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:false,
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
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 28,),
                            const Text(
                              'Request Accepted',
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
                              'You have successfully created a request of\n#4,000 share your request link to start\nreceiving money',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF151920).withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 22, right: 22),
                              child: Row(
                                children:[
                                  const Expanded(
                                    child: Text(
                                      'Add as a beneficiary?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Public Sans',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF161616)
                                      ),
                                    ),
                                  ),
                                  CupertinoSwitch(
                                    value: beneficiary,
                                    activeColor: const Color(0xFF3068A4),
                                    onChanged: (state){
                                      beneficiary = state;
                                      setState(() {

                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 38,),
                            InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, NewRequestLink.id);
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
                            const SizedBox(height:42)
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              }
          );
        }
    );
  }
}
