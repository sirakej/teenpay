import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/welcome/registration/login.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class CreatePin extends StatefulWidget {
  static const String id = 'CreatePin';
  const CreatePin({Key? key}) : super(key: key);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _pinController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _confirmPinController = TextEditingController();

  /// A boolean variable to hold whether the password should be shown or hidden
  bool _obscureTextLogin = true;

  String currentText = '';

  final formKey = GlobalKey<FormState>();
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(height: 24,),
                const Padding(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                    'Create Transactional PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616),
                    ),
                  ),
                ),
                const SizedBox(height: 68,),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'This would serve as your transactional PIN, do not\nreveal it to anyone',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF161616),
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildForm(),
                        const SizedBox(height: 80),
                        SizedBox(
                          width: SizeConfig.screenWidth!-160,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: MyConstants.primaryBorderRadius,
                              gradient: MyColors.primaryLinearGradient,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _ShowModalSheet();
                              },
                              child: const Text(
                                'Create New PIN',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Public Sans'
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 10),
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
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //pin
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pin",
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
                    obscureText: _obscureTextLogin,
                    controller: _pinController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your pin';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        suffixIcon: TextButton(
                          onPressed:_toggleLogin,
                          child:_obscureTextLogin ?
                          const Text(
                            "show",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ): const Text(
                            "Hide",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ),
                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Confirm Pin",
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
                    obscureText: _obscureTextLogin,
                    controller: _confirmPinController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Confirm pin';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration.copyWith(
                        suffixIcon: TextButton(
                          onPressed:_toggleLogin,
                          child:_obscureTextLogin ?
                          const Text(
                            "show",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ): const Text(
                            "Hide",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Public Sans',
                              fontSize: 14,
                              color: Color(0xFF042538),
                            ),
                          ),
                        )
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  /// A function to toggle if to show the password or not by
  /// changing [_obscureTextLogin] value
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
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
                      'Creation Completed',
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
                      'Account successfuly created Keep your\ndetails safe always',
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
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Login.id);
                        }
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
                            'Login',
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
