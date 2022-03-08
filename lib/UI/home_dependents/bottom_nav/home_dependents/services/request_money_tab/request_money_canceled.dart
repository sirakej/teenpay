import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class RequestMoneyCanceled extends StatefulWidget {
  static const String id = 'RequestMoneyCanceled';
  const RequestMoneyCanceled({Key? key}) : super(key: key);

  @override
  _RequestMoneyCanceledState createState() => _RequestMoneyCanceledState();
}

class _RequestMoneyCanceledState extends State<RequestMoneyCanceled> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.screenHeight!/8,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/request_money_empty.png",width: 245,height: 245,fit: BoxFit.contain,),
                  const SizedBox(height: 22.99,),
                  const Text(
                    'No Request has been made yet',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3068A4)
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'Use your kidssave account to create new request\nto parents/ guardian and others.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF151920).withOpacity(0.8)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
