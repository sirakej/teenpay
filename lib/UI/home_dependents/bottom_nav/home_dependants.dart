import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/airtime_and_data.dart';
import 'home_dependents/services/request_money/request_money.dart';
import 'home_dependents/services/save_money/save_money.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/dependants_request.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'home_dependents/services/send_money/send_money.dart';

class HomeDependants extends StatefulWidget {
  const HomeDependants({Key? key}) : super(key: key);

  @override
  _HomeDependantsState createState() => _HomeDependantsState();
}

class _HomeDependantsState extends State<HomeDependants> {
  bool see = false;
  String balance = "500,000.00";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            children: [
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("images/profile_image.png",width:29,height:29 ,fit: BoxFit.contain,),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Text(
                              'Welcome',
                              style:
                              TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color(0xFF444444).withOpacity(0.8)
                              ),
                            ),
                            const Text(
                              'Jane Adebola',
                              style:
                              TextStyle(
                                  color: Color(0xFF161616),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, Notifications.id);
                      },
                      child: Image.asset("images/notification.png",width:20,height:21.5,fit: BoxFit.contain,),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 128,
                        width: SizeConfig.screenWidth,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF3068A4)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 20,
                              bottom: -10,
                              child: Image.asset("images/side.png",width: 52.95,height: 80.32,fit: BoxFit.contain,),
                            ),
                            Positioned(
                              left: 130,
                              bottom: -30,
                              child: Image.asset("images/bottom.png",width: 52.95,height: 80.32,fit: BoxFit.contain,),
                            ),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight,
                              padding: const EdgeInsets.only(top:29,bottom: 29),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                                    const Text(
                                      'Available Balance',
                                      style:
                                      TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                    Text(
                                      see == false?'NGN $balance':"NGN ********",
                                      style:
                                      const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: SizeConfig.screenHeight,
                              width: SizeConfig.screenWidth,
                              padding: const EdgeInsets.only(top: 25,right: 27),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        see=!see;
                                      });},
                                    child: Container(
                                      height: 27,
                                      width: 36,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(image:AssetImage("images/ellipse.png") )
                                      ),
                                      child: see==false?const Icon(Icons.visibility_off_outlined,color: Colors.white,):
                                      const Icon(Icons.visibility_outlined,color: Colors.white,),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24,),
                      const Text(
                        'Services',
                        style:
                        TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF161616)
                        ),
                      ),
                      const SizedBox(height:4),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, SendMoney.id);
                                },
                                child: homeContainer(const Color(0xFFFEEAEA), "images/dependant.png","Send\nMoney",false),
                              )
                          ),
                          const SizedBox(width: 32,),
                          Expanded(child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AirtimeAndData.id);
                            },
                            child: homeContainer(const Color(0xFFE4EDFF), "images/funds.png","Airtime&\nData",false),
                          ))
                        ],
                      ),
                      const SizedBox(height: 24,),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, RequestMoney.id);
                              },
                              child: homeContainer(const Color(0xFFE3FFEE), "images/request.png","Request\nMoney",false),
                            ),
                          ),
                          const SizedBox(width: 32,),
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, SaveMoney.id);
                                },
                                child: homeContainer(const Color(0xFFEDE4FE), "images/investments.png","Save\nMoney",false),
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          const Text(
                            'Transactions',
                            style:
                            TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFF161616)
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                             // Navigator.pushNamed(context, Transactions.id);
                            },
                            child: const Text(
                              'View all',
                              style:
                              TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF3068A4)
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24,),
                      transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                      const SizedBox(height: 24,),
                      transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
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
  homeContainer(Color color, String image, String name,bool comingSoon){
    return Container(
      padding: const EdgeInsets.only(left: 24.91,top: 31,right: 27),
      height: 158,
      width: 158,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image,height: 24,width: 24,fit: BoxFit.contain,),
          const SizedBox(height: 24,),
          Text(
            name,
            style:
            const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF161616)
            ),
          ),
          const SizedBox(height: 10,),
          comingSoon == true ? Center(
            child: Text(
              "Coming soon",
              style:
              TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 8,
                  color: const Color(0xFF151920).withOpacity(0.32)
              ),
            ),
          ):Container()
        ],
      ),
    );
  }
  transactionContainer(String status,String name, String time,String day,String money){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            status == "Successful"? Container(
              height: 32,
              width: 32,
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF18873D).withOpacity(0.1)
              ),
              child: Center(
                child: Image.asset("images/successful.png",width: 18,height: 10.41,fit: BoxFit.contain,),
              ),
            ):
            Container(
              height: 32,
              width: 32,
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF313D).withOpacity(0.1)
              ),
              child: Center(
                child: Image.asset("images/fail.png",width: 18,height: 10.41,fit: BoxFit.contain,),
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                  const TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF161616)
                  ),
                ),
                const SizedBox(height: 9,),
                Text(
                  "$time . $day",
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: const Color(0xFF161616).withOpacity(0.5)
                  ),
                ),

              ],
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                money,
                style:
                const TextStyle(
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF161616)
                ),
              ),
              const SizedBox(height: 9,),
              Text(
                  status,
                  style:
                  TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: status == "Pending"?const Color(0xFFC6720F):
                      status == "Successful"?const Color(0xFF18873D):
                      status == "Cancelled"?const Color(0xFFF55353):null
                  )
              ),

            ],
          ),
        ),
      ],
    );
  }

}
