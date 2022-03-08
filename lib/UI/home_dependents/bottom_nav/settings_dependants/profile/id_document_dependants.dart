import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class IdDocumentDependants extends StatefulWidget {
  static const String id = 'IdDocumentDependants';
  const IdDocumentDependants({Key? key}) : super(key: key);

  @override
  _IdDocumentDependantsState createState() => _IdDocumentDependantsState();
}

class _IdDocumentDependantsState extends State<IdDocumentDependants> {
  bool international = false;
  bool votersCard= false;
  bool nin= false;
  bool license= false;
  String collect = "";

  void change(String given){
    setState((){collect =given;});
    print(collect);
  }
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
                  onPressed: (){},
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                      'ID Documents',
                      style:
                      TextStyle(
                          color: Color(0xFF161616),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                      ),
                    ),
                    const SizedBox(height: 44,),
                    Center(
                      child: Text(
                        'Verify your identification with one of these\npermanent means of Identification',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(
                            color: const Color(0xFF161616).withOpacity(0.8),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                    ),
                    const SizedBox(height: 47,)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose ID Type',
                        style:
                        TextStyle(
                            color: Color(0xFF161616),
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: _ShowModalSheet,
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
                              Container(),
                              Text(
                                // ignore: unnecessary_null_comparison, prefer_if_null_operators
                                collect == null? "":collect,
                                style:
                                const TextStyle(
                                    color: Color(0xFF161616),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: const Color(0xFF151920).withOpacity(0.32),
                                  size: 16,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      const SizedBox(height: 32,),
                      MaterialButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, IdDocument.id);
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
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
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
                      padding: const EdgeInsets.only(left: 25),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 2.73,),
                            const Text(
                              'Choose ID',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF161616),
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                                onTap: (){
                                  setState((){
                                    international=true;
                                    license=false;
                                    votersCard = false;
                                    nin = false;
                                    change("International Passport");
                                    Navigator.pop(context);
                                  });
                                },
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  international == false? Icon(
                                        Icons.radio_button_off,
                                        size: 20,
                                        color: const Color(0xFF151920).withOpacity(0.32),
                                      ):
                                      const Icon(
                                        Icons.radio_button_on,
                                        size: 20,
                                        color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'International Passport',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  votersCard=true;
                                  license=false;
                                  nin = false;
                                  international = false;
                                  change("Voter’s Card");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     votersCard == false? Icon(
                                       Icons.radio_button_off,
                                       size: 20,
                                       color: const Color(0xFF151920).withOpacity(0.32),
                                     ):
                                     const Icon(
                                       Icons.radio_button_on,
                                       size: 20,
                                       color: Color(0xFF3068A4),
                                     ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Voter’s Card',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  nin=true;
                                  license=false;
                                  votersCard = false;
                                  international = false;
                                  change("NIN Slip");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                      nin == false? Icon(
                                        Icons.radio_button_off,
                                        size: 20,
                                        color: const Color(0xFF151920).withOpacity(0.32),
                                      ):
                                      const Icon(
                                        Icons.radio_button_on,
                                        size: 20,
                                        color: Color(0xFF3068A4),
                                      ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'NIN Slip',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 33,),
                            InkWell(
                              onTap:  (){
                                setState(() {
                                  license=true;
                                  votersCard = false;
                                  nin = false;
                                  international = false;
                                  change("Driver’s License");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  license == false? Icon(
                                    Icons.radio_button_off,
                                    size: 20,
                                    color: const Color(0xFF151920).withOpacity(0.32),
                                  ):
                                  const Icon(
                                    Icons.radio_button_on,
                                    size: 20,
                                    color: Color(0xFF3068A4),
                                  ),
                                  const SizedBox(width:26,),
                                  const Text(
                                    'Driver’s License',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF161616),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height:33)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },

          );
        }
    );
  }

}
