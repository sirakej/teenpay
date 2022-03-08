import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class SpendLimit extends StatefulWidget {
  static const String id = 'SpendLimit';
  const SpendLimit({Key? key}) : super(key: key);

  @override
  _SpendLimitState createState() => _SpendLimitState();
}

class _SpendLimitState extends State<SpendLimit> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _dailyLimitController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _monthlyLimitController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Spend Limit',
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
                                    'Set Limit',
                                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 48,),
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
                "Daily Limit",
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
                    controller: _dailyLimitController,
                    keyboardType: TextInputType.number,
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
          //Account Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Monthly Limit",
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
                    controller: _monthlyLimitController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Limit';
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
        ],
      ),
    );
  }
}
