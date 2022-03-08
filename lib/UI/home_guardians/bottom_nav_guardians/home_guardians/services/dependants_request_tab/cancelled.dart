import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class Cancelled extends StatefulWidget {
  static const String id = 'Cancelled';
  const Cancelled({Key? key}) : super(key: key);

  @override
  _CancelledState createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
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
            SizedBox(height: SizeConfig.screenHeight!/5,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/empty_dependants.png",width: 156,height: 156,fit: BoxFit.contain,),
                  const SizedBox(height: 35.99,),
                  const Text(
                    'No cancelled request so far',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3068A4)
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
