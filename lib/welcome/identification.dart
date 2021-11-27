import 'package:flutter/material.dart';

import 'components/identity.dart';

class Identification extends StatelessWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Identification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 99,
                ),
                const Text(
                  'Who are you?',
                  style: TextStyle(
                      color: Color(0xFF3068A4),
                      fontSize: 36,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please select the right option that represents you',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: const Color(0xFF161616)),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/authentication');
                      },
                      child: const Identity(
                        identifier: 'Parent',
                        imageroute: 'images/parent_user.png',
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/authentication');
                      },
                      child: const Identity(
                        identifier: 'Child',
                        imageroute: 'images/child_user.png',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
