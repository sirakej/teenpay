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
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: MyConstants.primaryBorderRadius,
          gradient: MyColors.primaryLinearGradient,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
      ),
    );
  }
}
