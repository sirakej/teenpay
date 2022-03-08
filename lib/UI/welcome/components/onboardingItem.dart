import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingItem extends StatelessWidget{
  final String lottiePath;
  final String title;
  final String body;
  const OnBoardingItem(
      {Key? key,
        required this.lottiePath,
        required this.title,
        required this.body}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Lottie.asset(
         lottiePath,
         alignment: Alignment.center,
         fit: BoxFit.contain,
         height: 294,
         width: 294
       ),
        const SizedBox(height:15,),
        Text(
          title,
          style:const TextStyle(
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF3068A4)
          ),
        ),
        const SizedBox(height:24,),
        Text(
          body,
          textAlign: TextAlign.center,
          style:const TextStyle(
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF161616)
          ),
        ),
      ],
    );
  }

}

