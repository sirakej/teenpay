import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/id_document.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class UpgradeAccount extends StatefulWidget {
  static const String id = 'UpgradeAccount';
  const UpgradeAccount({Key? key}) : super(key: key);

  @override
  _UpgradeAccountState createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeAccount> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Text(
                  'Upgrade Account',
                  style:
                  TextStyle(
                      color: Color(0xFF161616),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 33,),
                      InkWell(
                          onTap: (){},
                          child: buttonContainer("images/bank.png", "BVN", true)
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                          onTap:_ShowModalSheet,
                          child: buttonContainer("images/terms.png", "ID Documents",false)
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                          onTap: (){},
                          child: buttonContainer("images/home_icon.png", "Residential Address", false)
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                          onTap: (){},
                          child: buttonContainer("images/Frame.png", "Utility Bill", false)
                      ),
                      const SizedBox(height: 33,),
                      InkWell(
                          onTap: (){},
                          child: buttonContainer("images/camera.png", "Selfie",false)
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
  // ignore: non_constant_identifier_names
  buttonContainer(String image, String name,bool ads){
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
                ads == true ? Container(
                  width: 43,
                  height: 19,
                  decoration: BoxDecoration(
                      color: const Color(0xFF18873D).withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Center(
                    child: Text(
                      "Done",
                      style:
                      TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xFF161616)
                      ),
                    ),
                  ),
                ):Container()
              ],
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        const Icon(Icons.chevron_right_outlined,color: Color(0xFF323232),size: 18,)
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
                      color: const Color(0xFF000000).withOpacity(0.62),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 2.73,),
                        const Text(
                          'ID Document requirements',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF161616),
                          ),
                        ),
                        const SizedBox(height:45,),
                        modalContainer("images/document.png", "Have your documents ready", "Before you proceed, get the documents you need ready\nsuch as Driver’s Licence International passport, NIN slip,\nVoter’s Card"),
                        const SizedBox(height:24),
                        modalContainer("images/light.png", "Stay in  a well light environment", "To take a very good real time picture of yourself, you need to\nbe somewhere with good illumination so that it captures\nyour face well"),
                        const SizedBox(height:40),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, IdDocument.id);
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
                                'Continue',
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:10)
              ],
            ),
          ),
          ),

              ],
            ),
          );
        }
    );
  }

  modalContainer(String image, String name,String explain){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,width: 39,height: 39,fit: BoxFit.contain,),
            const SizedBox(width: 13,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 4,),
                Text(
                  explain,
                  style:
                  TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: const Color(0xFF161616).withOpacity(0.5)
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
