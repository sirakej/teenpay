import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/dependants_request_tab/accept_confirmation.dart';

import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class Pending extends StatefulWidget {
  static const String id = 'Pending';
  const Pending({Key? key}) : super(key: key);

  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController _reasonsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const SizedBox(height: 24,),
              _pendingContainer('Oripeloye Emmanuel denied your request for N20,000.00','reason: I’ll call you to tell you something later..'),
              const SizedBox(height: 24,),
              _pendingContainer('Oripeloye Emmanuel denied your request for N20,000.00','reason: I’ll call you to tell you something later..'),
              const SizedBox(height: 24,),
              _pendingContainer('Oripeloye Emmanuel denied your request for N20,000.00','reason: I’ll call you to tell you something later..'),
              const SizedBox(height: 24,),
              _pendingContainer('Oripeloye Emmanuel denied your request for N20,000.00','reason: I’ll call you to tell you something later..'),
              const SizedBox(height: 24,),
              _pendingContainer('Oripeloye Emmanuel denied your request for N20,000.00','reason: I’ll call you to tell you something later..'),
            ],
          ),
        ),
      ),
    );
  }
  _pendingContainer(String details, String reason){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("images/profile_image.png",width:35 ,height:35 ,fit: BoxFit.contain),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                details,
                style:const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3068A4)),
              ),
              Text(
                reason,
                style:TextStyle(
                  fontSize: 14,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w900,
                  color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                ),
              ),
              const SizedBox(height: 7,),
              Text(
                '30 mins ago',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF161616).withOpacity(0.4)
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: _ShowModalSheet,
                        child: const Text(
                          'Decline',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF55353)
                          ),
                        )
                    ),
                    Container(),
                    TextButton(
                        onPressed:_RequestShowModalSheet,
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF18873D)
                          ),
                        )
                    ),
                    Container(),
                  ],

                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  _ShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return Container(
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 22,),
                Center(
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF000000).withOpacity(0.62),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("images/X.png",width:24 ,height: 24,fit: BoxFit.contain,)
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),
                      Text(
                        'Creation Completed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        ),
                      ),
                      const SizedBox(height:45,),
                      Image.asset("images/decline.png", width: 50,height: 50,fit: BoxFit.contain,),
                      const SizedBox(height: 28,),
                      Text(
                        'Give reasons for rejecting the sent request',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 31,),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left:16,right:16 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reasons(Optional)",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Public Sans',
                                  fontSize: 14,
                                  color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: SizeConfig.screenWidth,
                                child: TextFormField(
                                    controller: _reasonsController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Public Sans',
                                      color: Color(0xFF161616),
                                    ),
                                    decoration:MyConstants.formInputDecoration
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 38,),
                      InkWell(
                        onTap:(){


                        },
                        child:Container(
                          width: 151,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.transparent,
                              border:Border.all(
                                  color: const Color(0xFFF55353),
                                  width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Center(
                            child: Text(
                              'Decline',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF55353),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:82)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  // ignore: non_constant_identifier_names
  _RequestShowModalSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled:true,
        isDismissible: false,
        context: context,
        builder: (context){
          return Container(
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 22,),
                Center(
                  child: Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF000000).withOpacity(0.62),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("images/X.png",width:24 ,height: 24,fit: BoxFit.contain,)
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Request Confirmation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                        ),
                      ),
                      const SizedBox(height:45,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recipient',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                               Text(
                                  '+2349055380387',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width:SizeConfig.screenWidth,
                              color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF161616).withOpacity(0.08),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                Text(
                                  'N75,000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width: SizeConfig.screenWidth,
                              color: Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF161616).withOpacity(0.08),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Desc',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF151920).withOpacity(0.32),
                                  ),
                                ),
                                Text(
                                  'Flex Money for Christmas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color:  Get.isDarkMode?AppColors.darkTextWhite:AppColors.lightTextBlack,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 1,
                              width: SizeConfig.screenWidth,
                              color:  Get.isDarkMode?AppColors.darkTextWhite:const Color(0xFF161616).withOpacity(0.08),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height:82),
                      Padding(
                        padding: const EdgeInsets.only(left: 36,right: 36),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AcceptConfirmation.id);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: 50,
                            decoration:BoxDecoration(
                                gradient:LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color(0XFF1F8BB6).withOpacity(1),
                                    const Color(0xFF335491).withOpacity(1),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(8))
                            ),
                            child: const Center(
                              child: Text(
                                'Accept',
                                style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:32),
                      TextButton(
                          onPressed: _ShowModalSheet,
                          child: const Text(
                            'Decline',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF55353)
                            ),
                          )
                      ),
                      const SizedBox(height:42)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}
