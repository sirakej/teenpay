import 'package:flutter/material.dart';

class Identifier extends StatelessWidget {
  const Identifier({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.account_circle_outlined,
          size: 45,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome'),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
