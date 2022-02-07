import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/security.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'legal.dart';

class SettingsGuardians extends StatefulWidget {
  const SettingsGuardians({Key? key}) : super(key: key);

  @override
  _SettingsGuardiansState createState() => _SettingsGuardiansState();
}

class _SettingsGuardiansState extends State<SettingsGuardians> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(left: 16,right: 16),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              const Text(
                'Settings',
                style:
                TextStyle(
                    color: Color(0xFF161616),
                    fontFamily: 'Public sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 65,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Security.id);
                        },
                        child: settingsContainer("images/security.png", "Security", "Your Password account"),
                      ),
                      const SizedBox(height: 33,),
                      settingsContainer("images/limit.png", "Account Limit", "see the limits your accounts can have"),
                      const SizedBox(height: 33,),
                      settingsContainer("images/friends.png", "Invite Friends", "Invite friends to start using this app"),
                      const SizedBox(height: 33,),
                      settingsContainer("images/help.png", "Help and support", "Get help and support here"),
                      const SizedBox(height: 33,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,Legal.id);
                        },
                        child: settingsContainer("images/legal.png", "Legal", "Terms and other legal documents"),
                      ),
                      const SizedBox(height: 33,),
                      settingsContainer("images/customize.png", "Customization", "Customize to your own look and feel"),
                      const SizedBox(height: 50,),
                      const Text(
                        'Follow Us',
                        style:
                        TextStyle(
                            color: Color(0xFFA2A0A8),
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Image.asset("images/tweet.png",width: 64,height: 64,fit: BoxFit.contain,)),
                          Expanded(child: Image.asset("images/Facebook.png",width: 64,height: 64,fit: BoxFit.contain,)),
                          Expanded(child: Image.asset("images/TikTok.png",width: 64,height: 64,fit: BoxFit.contain,)),
                          Expanded(child: Image.asset("images/Instagram.png",width: 64,height: 64,fit: BoxFit.contain,))
                        ],
                      ),
                      const SizedBox(height: 32,),
                      MaterialButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            const Text(
                              'Log out',
                              style:
                              TextStyle(
                                  color: Color(0xFFF55353),
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                            ),
                            const SizedBox(width: 11,),
                            Image.asset("images/log_out.png",width: 20,height: 18,fit: BoxFit.contain,),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Center(
                        child: Text(
                          'TeenPay © 2021 v1.0',
                          style:
                          TextStyle(
                              color: Color(0xFF9EA3AE),
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  settingsContainer(String image, String name, String explain){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(image,width: 24,height: 24,fit: BoxFit.contain,),
            const SizedBox(width: 24,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                  const TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF161616)
                  ),
                ),
                const SizedBox(height: 9,),
                Text(
                  explain,
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: const Color(0xFF161616).withOpacity(0.5)
                  ),
                ),

              ],
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        const Icon(Icons.chevron_right_outlined,color: Color(0xFF323232),size: 18,)
      ],
    );
  }

}
