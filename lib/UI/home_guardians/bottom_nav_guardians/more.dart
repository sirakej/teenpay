import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/customization.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/profile.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/security.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'manage_activities/physical_card.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
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
                'More',
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
                         // Navigator.pushNamed(context, Security.id);
                        },
                        child: buildContainer("images/budget.png", "Budget", "View, update  your informations"),
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                        onTap: (){
                         // Navigator.pushNamed(context, AccountLimit.id);
                        },
                        child: buildContainer("images/task.png", "Task/Goals", "View, update  your informations"),
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, PhysicalCard.id);
                        },
                        child: buildContainer("images/card.png", "Physical Cards", "View, update  your informations"),
                      ),
                      const SizedBox(height: 50,),
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

  buildContainer(String image, String name, String explain){
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
