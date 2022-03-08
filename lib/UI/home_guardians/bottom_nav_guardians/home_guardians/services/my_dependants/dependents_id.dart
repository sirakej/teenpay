import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/my_dependants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class DependantsId extends StatefulWidget {
  static const String id = 'DependantsId';
  const DependantsId({Key? key}) : super(key: key);

  @override
  _DependantsIdState createState() => _DependantsIdState();
}

class _DependantsIdState extends State<DependantsId> {

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
                    'Dependants ID',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF161616)

                    ),
                  ),
                ),
                const SizedBox(height:44),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Input the child ID on the Dependant\nregistration process for Identification',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color:const Color(0xFF161616).withOpacity(0.8)
                            ),
                          ),
                        ),
                        const SizedBox(height:50),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Copy ID',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color:Color(0xFF3068A4)
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
                              height: 50,
                              decoration:BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: const Color(0xFF151920).withOpacity(0.32)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "CD123334u4",
                                    style:
                                    TextStyle(
                                        color: Color(0xFF161616),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 48,
                                    decoration:const BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(4) ,bottomRight:Radius.circular(4) ),
                                        color: Color(0xFF3068A4),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        const SizedBox(height: 20,),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return const MyDependants(collect:true);}));
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
                                'Get started',
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
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
