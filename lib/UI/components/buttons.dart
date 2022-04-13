import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:stripling_wallet/utils/constants.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({Key? key, required this.route, required this.text})
      : super(key: key);
  final String route;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        //Navigator.pushNamed(context, DebitCard.id);
        Navigator.pushReplacementNamed(context, route);
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
        child:Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
