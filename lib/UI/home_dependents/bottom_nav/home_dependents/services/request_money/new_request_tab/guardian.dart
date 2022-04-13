import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/send_money/confirmation_pin.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class Guardian extends StatefulWidget {
  static const String id = 'Guardian';
  const Guardian({Key? key}) : super(key: key);

  @override
  _GuardianState createState() => _GuardianState();
}

class _GuardianState extends State<Guardian> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _amountController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _requestTitleController = TextEditingController();

 /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _descriptionController = TextEditingController();

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
              const SizedBox(height: 50,),
              Expanded(
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 30,),
                      MaterialButton(
                        onPressed: (){},
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
                              'Send Request',
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
                height: 50,
                child: TextFormField(
                    keyboardType:TextInputType.text,
                    controller: _requestTitleController,
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
                height: 50,
                child: TextFormField(
                    keyboardType:TextInputType.number,
                    controller: _amountController,
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
                height: 50,
                child: TextFormField(
                    controller: _descriptionController,
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
}
