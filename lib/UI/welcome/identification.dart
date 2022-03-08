import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/index.dart';
import 'package:stripling_wallet/UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import 'components/identity.dart';

class Identification extends StatelessWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
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
              Container(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Identification',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Who are you?',
                      style: TextStyle(
                          fontFamily: 'Public Sans',
                          color: Color(0xFF3068A4),
                          fontSize: 36,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please select the right option that represents you',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(
                          color: const Color(0xFF161616),
                          fontFamily: 'Public Sans',

                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, GuardianSignUp.id);
                          },
                          child: const Identity(
                            identifier: 'Guardian',
                            imageroute: 'images/parent_user.png',
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Index.id);
                          },
                          child: const Identity(
                            identifier: 'Dependant',
                            imageroute: 'images/child_user.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
