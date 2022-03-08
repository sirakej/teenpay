import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/target_confirmation.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class TargetSavingsTwo extends StatefulWidget {
  static const String id = 'TargetSavingsTwo';
  const TargetSavingsTwo({Key? key}) : super(key: key);

  @override
  _TargetSavingsTwoState createState() => _TargetSavingsTwoState();
}

class _TargetSavingsTwoState extends State<TargetSavingsTwo> {

  String placeHolder = "";

  void change(String given){
    setState((){
      placeHolder =given;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Column(
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
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Target Savings',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF161616)
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 80,),
                          Padding(
                            padding:const EdgeInsets.only(left: 16,right: 16),
                            child: _buildTargetingForm(),
                          ),
                          const SizedBox(height: 40,),
                          MaterialButton(
                            onPressed:(){
                              Navigator.pushNamed(context, TargetConfirmation.id);
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
                                  'Continue',
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48,),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTargetingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferred Time',
              style:
              TextStyle(
                  color: Color(0xFF161616),
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 4,),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: (){},
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
                        placeHolder == null? "":placeHolder,
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
          ],
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set start date ',
              style:
              TextStyle(
                  color: Color(0xFF161616),
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 4,),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: (){},
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
                        placeHolder == null? "":placeHolder,
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
          ],
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set withdrawal date ',
              style:
              TextStyle(
                  color: Color(0xFF161616),
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 4,),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: (){},
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
                        placeHolder == null? "":placeHolder,
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
          ],
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select primary source',
              style:
              TextStyle(
                  color: Color(0xFF161616),
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 4,),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: (){},
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
                        placeHolder == null? "":placeHolder,
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
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

}
