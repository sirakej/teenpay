import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class AddDebitCard extends StatefulWidget {
  static const String id = 'AddDebitCard';
  const AddDebitCard({Key? key}) : super(key: key);

  @override
  _AddDebitCardState createState() => _AddDebitCardState();
}

class _AddDebitCardState extends State<AddDebitCard> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _fullNameController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _emailController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _phoneNumberController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Add debit card',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF161616)
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(height: 80,),
                            Padding(
                              padding:const EdgeInsets.only(left: 16,right: 16),
                              child: _buildSignIn(),
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
                                    'Add Debit Card',
                                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 48,),
                            Text(
                              'The issuer of your debit card may request that you enter\nyour card detail to validate the transaction\n\nWe do not store, keep or share your card and personal\ninformation''s''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF151920).withOpacity(0.8),
                              ),
                            ),
                          ],
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignIn() {
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
                "Name on card",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your card name';
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
          const SizedBox(height: 40),
          //Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "card number",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      if (value.length < 3 || !value.contains("@") || !value.contains(".")){
                        return 'Invalid email address';
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
          const SizedBox(height: 40),
          //phone number
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Expiry date",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Public Sans',
                        fontSize: 14,
                        color: Color(0xFF161616),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your phone number';
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
              ),
              const SizedBox(width: 27,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "cvv",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Public Sans',
                        fontSize: 14,
                        color: Color(0xFF161616),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your phone number';
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
