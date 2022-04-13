import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/regular_savings_confirmation.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class RegularSavings extends StatefulWidget {
  static const String id = 'RegularSavings';
  const RegularSavings({Key? key}) : super(key: key);

  @override
  _RegularSavingsState createState() => _RegularSavingsState();
}

class _RegularSavingsState extends State<RegularSavings> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _commentController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _amountController = TextEditingController();

  String placeHolder = "";

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
                const SizedBox(height: 30,),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 80,),
                          Padding(
                            padding:const EdgeInsets.only(left: 16,right: 16),
                            child: _buildTargetingForm(),
                          ),
                          const SizedBox(height: 40,),
                          MaterialButton(
                            onPressed:(){
                              Navigator.pushNamed(context, RegularSavingsConfirmation.id);
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
                          const SizedBox(height: 48,),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTargetingForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What are you saving up for?",
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
                    controller: _commentController,
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
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How much do  you want to save?",
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
            ],
          ),
          const SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How often do you want to save?',
                style:
                TextStyle(
                    color: Color(0xFF161616),
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                ),
              ),
              const SizedBox(height: 4,),

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
          const SizedBox(height: 40),
        ],
      ),
    );
  }

}
