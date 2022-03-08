import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/funds_dependant/funds_dependant.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import '../transactions.dart';

class DependantsDetails extends StatefulWidget {
  static const String id = 'DependantsDetails';
  final String dependantsName;
  final String currentBalance;
  const DependantsDetails({
    Key? key,
    required this.dependantsName,
    required this.currentBalance,
  }) : super(key: key);

  @override
  _DependantsDetailsState createState() => _DependantsDetailsState();
}

class _DependantsDetailsState extends State<DependantsDetails> {
  int touchedIndex = 0;
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
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      widget.dependantsName,
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF161616)
                      ),
                    ),
                  ),
                  PopupMenuButton(
                      itemBuilder:(context) => [
                        PopupMenuItem(
                          onTap:(){},
                          child: const Text("Manage Activities"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          onTap: (){
                            Navigator.pushNamed(context, Transactions.id);
                          },

                          child: const Text("Transactions"),
                        )
                      ]
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "current balance",
                        style:TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: const Color(0xFF161616).withOpacity(0.5)
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        widget.currentBalance,
                        style:const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            color: Color(0xFF161616)
                        ),
                      ),
                      const SizedBox(height:24,),
                      AspectRatio(
                      aspectRatio: 1.6,
                        child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex =
                                    pieTouchResponse.touchedSection!.touchedSectionIndex;
                              });
                            }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        sections: showingSections()
                        ),
                      ),
        ),

                      Padding(
                        padding: const EdgeInsets.only(left: 37,right: 37),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                //Navigator.pushNamed(context, DebitCard.id);
                                Navigator.pushNamed(context,FundsDependant.id);
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
                                    'Funds Dependants',
                                    style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height:32,),
                            transactionDetails("Transfers"),
                            const SizedBox(height:32,),
                            transactionDetails("Airtime"),
                            const SizedBox(height:32,),
                            transactionDetails("Data"),
                            const SizedBox(height:32,),
                            transactionDetails("Savings"),
                          ],
                        ),
                      )
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
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff3068A4),
            //value: 40,
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff2095BE),
            //value: 30,
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffF55353),
            //value: 90,
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff18873D),
            //value: 15,
            radius: radius,
          );
        default:
          throw 'Oh no';
      }
    });
  }
  transactionDetails(String transactionDetails){
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: transactionDetails == "Transfers"?const Color(0xFFF55353):
            transactionDetails == "Airtime"?const Color(0xFF2095BE):
            transactionDetails == "Data"?const Color(0xFF3068A4):
            transactionDetails == "Savings"?const Color(0xFF18873D):null
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
            child: Text(
              "${widget.dependantsName} has spent N123,344.55 on $transactionDetails",
              style:const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF161616)
              ),
            )
        )
      ],
    );
  }
}
