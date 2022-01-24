import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class SendInstructions extends StatefulWidget {
  static const String id = 'SendInstruction';
  const SendInstructions({Key? key}) : super(key: key);

  @override
  _SendInstructionsState createState() => _SendInstructionsState();
}

class _SendInstructionsState extends State<SendInstructions> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF161616),
                  ),
                ),
              ),
              const SizedBox(height: 58,),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/reset_password.png",width:216,height:195,fit: BoxFit.contain,),
                    const Text(
                      'Check Your Mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF161616),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                      'Your reset Password instructions have been sent to\nyour Mail.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF161616),
                      ),
                    ),
                    const SizedBox(height: 24,),
                    InkWell(
                      onTap:(){},
                      child:Container(
                        width: 302,
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
                    const SizedBox(height: 32,),
                    const Text(
                      'Didn’t get the reset instruction in your mail? check\nthe spam folder or retry ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF161616),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
