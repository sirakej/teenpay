import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class SaveMoneySelect extends StatefulWidget {

  static const String id = 'SaveMoneySelect';
  const SaveMoneySelect({
    Key? key,
  }) : super(key: key);

  @override
  _SaveMoneySelectState createState() => _SaveMoneySelectState();
}

class _SaveMoneySelectState extends State<SaveMoneySelect> {
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
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Money for new phone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616)
                      ),
                    ),
                    PopupMenuButton(
                      color: const Color(0xFFFFFFFF),
                      itemBuilder:(context) => [
                        const PopupMenuItem(
                          child: Text("Edit"),
                          value: 1,
                        ),
                        const PopupMenuItem(
                          child: Text("Delete"),
                          value: 2,
                        ),
                        const PopupMenuItem(
                          child: Text("Request Statement"),
                          value: 2,
                        )
                      ],

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 24,right: 24 ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Current/Target',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF151920).withOpacity(0.8)
                              ),
                            ),
                            const SizedBox(height: 8,),
                            const Text(
                              'N10,000.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF161616)
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              '/400,000.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Public Sans',
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF151920).withOpacity(0.8)
                              ),
                            ),
                            const SizedBox(height: 12,),
                            LinearProgressIndicator(
                              value: 10,
                              color: const Color(0xFF18873D),
                              backgroundColor: const Color(0xFF000000).withOpacity(0.2),
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '23.12.2021',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                Text(
                                  '40%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset("images/add_money.png",width:34 ,height:34 ,fit: BoxFit.contain,),
                                const SizedBox(height: 12,),
                                const Text(
                                  'Add Money',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset("images/withdrawal.png",width:34 ,height:34 ,fit: BoxFit.contain,),
                                const SizedBox(height: 12,),
                                const Text(
                                  'Withdrawal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset("images/interest.png",width:34 ,height:34 ,fit: BoxFit.contain,),
                                const SizedBox(height: 12,),
                                const Text(
                                  'Interest',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 82,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Next saving date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  'NONE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saving Type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  'Target savings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Automation status',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  'On hold',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  'Jan 23,2021',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Maturity date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  'July 24, 2021',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Interest P.A',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF151920).withOpacity(0.8)
                                  ),
                                ),
                                const Text(
                                  '5%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF161616)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
