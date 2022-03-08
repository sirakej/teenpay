import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/my_dependants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import '../../../../index.dart';


class NewRequestLink extends StatefulWidget {
  static const String id = 'NewRequestLink';
  const NewRequestLink({Key? key}) : super(key: key);

  @override
  _NewRequestLinkState createState() => _NewRequestLinkState();
}

class _NewRequestLinkState extends State<NewRequestLink> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'New Request',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF161616)

                    ),
                  ),
                ),
                const SizedBox(height:64),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Share the link below to receive\nmoney from anyone',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color:const Color(0xFF161616).withOpacity(0.8)
                            ),
                          ),
                        ),
                        const SizedBox(height:63),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Copy link',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color:Color(0xFF335491)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Clipboard.setData(const ClipboardData(text:"CD123334u4")).then((_){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("ID copied to clipboard")));
                            });
                          },
                          child: Container(
                              width: SizeConfig.screenWidth,
                              height:93,
                              padding: const EdgeInsets.only(left: 19,right: 19),
                              decoration:BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  color: const Color(0xFF000000).withOpacity(0.05)
                              ),
                              child: const Center(
                                child: Text(
                                  "HTTPS://WWW.TEENPAY.AFRICA/UBJSNF/JSJBJSBB",
                                  style:
                                  TextStyle(
                                      color: Color(0xFF161616),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                              )
                          ),
                        ),
                        const SizedBox(height: 40,),
                        Center(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Index.id);
                            },
                            child: Container(
                              width: 302,
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
                                  'Share my link',
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                                ),
                              ),
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
      ),
    );
  }
}
