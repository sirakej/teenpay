import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/dependants_details.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/manage_activities.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import '../transactions.dart';
import 'add_dependent.dart';

class MyDependants extends StatefulWidget {

  static const String id = 'MyDependants';
  final bool collect;
  const MyDependants({
    Key? key,
    required this.collect,
  }) : super(key: key);

  @override
  _MyDependantsState createState() => _MyDependantsState();
}

class _MyDependantsState extends State<MyDependants> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode?AppColors.darkBackground:AppColors.lightBackground,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, IndexGuardian.id);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                    size: 39,
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Dependants',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                  ),
                ),
              ),
              widget.collect == true? const SizedBox(height: 10,):SizedBox(height: SizeConfig.screenHeight!/5,),
              widget.collect == true?
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context) {
                                return const DependantsDetails(dependantsName: "Tobi Tijani", currentBalance: "N412,029.00");
                                  }
                                  )
                              );
                            },
                            child: fullDependantsContainer(const Color(0xFFFEEAEA), "Tobi Tijani", "N412,029.00"),
                          ),
                          const SizedBox(height: 24,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context) {
                                    return const DependantsDetails(dependantsName: "Hassan Tijani", currentBalance: "N112,029.00");
                                  }
                                  )
                              );
                            },
                            child: fullDependantsContainer(const Color(0xFFE4EDFF), "Hassan Tijani", "N112,029.00"),
                          ),
                          const SizedBox(height: 24,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context) {
                                    return const DependantsDetails(dependantsName:"Titilope James", currentBalance: "N112,029.00");
                                  }
                                  )
                              );
                            },
                            child:  fullDependantsContainer(const Color(0xFFE3FFEE), "Titilope James", "N112,029.00"),
                          ),

                        ],
                      ),
                    ),
                  )
                  :Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/empty_dependants.png",width: 156,height: 156,fit: BoxFit.contain,),
                    const SizedBox(height: 35.99,),
                    const Text(
                      'No Dependant has been added so far',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3068A4)
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      'Kindly click on the button below to add your dependant\nor children',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w400,
                          color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: const Color(0xFF3068A4),
        child: const Icon(
          Icons.add,
          size: 16,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddDependants.id);
        },
      ),
    );
  }

  fullDependantsContainer(Color color,String name, String currentBalance){
    return Container(
      padding: const EdgeInsets.only(top: 23,bottom: 13),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        children: [
          Image.asset("images/profile_image.png",width:29,height:29 ,fit: BoxFit.contain,),
          Text(
            name,
            style:const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF161616)
            ),
          ),
          const SizedBox(height: 24,),
          Text(
            "current balance",
            style:TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: const Color(0xFF161616).withOpacity(0.5)
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            currentBalance,
            style:const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF161616)
            ),
          ),
        ],
      ),
    );
  }
}
