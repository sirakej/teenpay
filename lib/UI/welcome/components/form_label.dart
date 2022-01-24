import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
