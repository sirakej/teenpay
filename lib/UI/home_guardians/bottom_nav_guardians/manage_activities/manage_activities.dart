import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/data_limit.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/physical_card.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/spend_limit.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/transfer_limit.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'child_statement.dart';

class ManageActivities extends StatefulWidget {
  const ManageActivities({Key? key}) : super(key: key);

  @override
  _ManageActivitiesState createState() => _ManageActivitiesState();
}

class _ManageActivitiesState extends State<ManageActivities> {
  bool lockAccount = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Color(0xFF161616),
                          size: 39,
                        )
                    ),
                    Image.asset("images/profile_image.png",width:29,height:29 ,fit: BoxFit.contain,),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(left:16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                      'Manage Activities',
                      style:
                      TextStyle(
                          color: Color(0xFF161616),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      'Put a limit on how much to be spent on different activities',
                      style:
                      TextStyle(
                          color: const Color(0xFF161616).withOpacity(0.8),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, SpendLimit.id);
                        },
                        child: activitiesContainer("images/send-plane-line.png", "Set Spend Limit", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, TransferLimit.id);
                        },
                        child: activitiesContainer("images/send-plane-line.png", "Set Transfer Limit", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, DataLimit.id);
                        },
                        child: activitiesContainer("images/smartphone-line.png", "Set Data/Airtime Limit", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ChildStatement.id);
                        },
                        child: activitiesContainer("images/booklet-line.png", "Request child statement", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          //Navigator.pushNamed(context, .id);
                        },
                        child: activitiesContainer("images/key-2-line.png", "Change PIN", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 24,),
                      buttonContainer("images/lock-password-line.png","Lock Account", "View, update  your informations"),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, PhysicalCard.id);
                        },
                        child: activitiesContainer("images/key-2-line.png", "Physical card", "View, update  your informations",false),
                      ),
                      const SizedBox(height: 64,),
                      activitiesContainer("images/delete.png", "Delete Child’s account", "View, update  your informations",true),
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
  activitiesContainer(String image, String name, String explain,bool delete){
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
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: delete == true ? const Color(0xFFF55353):const Color(0xFF161616)
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
  buttonContainer(String image,String name, String explain){
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
        CupertinoSwitch(
          value: lockAccount,
          activeColor: const Color(0xFF3068A4),
          onChanged: (v){
            lockAccount = v;
            setState(() {

            });
          },
        )
      ],
    );
  }
}
