import 'package:flutter/material.dart';

class Identity extends StatelessWidget {
  const Identity({Key? key, required this.identifier, required this.imageroute})
      : super(key: key);
  final String imageroute;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 94,
          width: 102,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Image.asset(imageroute),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            identifier,
            style: TextStyle(
                color: Color(0xFF161616),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
