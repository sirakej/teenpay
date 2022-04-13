import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/airtime_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/data_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/savings_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/transfers_transaction.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class Analytics extends StatefulWidget {

  const Analytics({
    Key? key,
  }) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    // set _isLoaded to true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  bool _isLoaded = false;

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
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Analytics',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 300,
                child: LineChart(
                  mainData(),
                  swapAnimationCurve: Curves.linear,
                  swapAnimationDuration: const Duration(milliseconds: 1000),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          const Text(
                            'Overview',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF161616)
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 22,top: 19,bottom:19,right: 22),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF18873D),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Public Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(
                                      'NGN 154,356',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Public Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 22,top: 19,bottom:19,right: 22),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF55353),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Public Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(
                                      'NGN 594,000',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Public Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 32,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Spending Categories',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF161616)
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, TransfersTransaction.id);
                            },
                            child: spendingCategoriesContainer("Transfer","20 Transactions", "N123,344.54"),
                          ),
                          InkWell(
                            onTap: (){
                                Navigator.pushNamed(context, AirtimeTransaction.id);
                            },
                            child: spendingCategoriesContainer("Airtime","20 Transactions", "N123,344.54"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, DataTransaction.id);
                            },
                            child: spendingCategoriesContainer("Data","20 Transactions", "N123,344.54"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, SavingsTransaction.id);
                            },
                            child: spendingCategoriesContainer("Savings","20 Transactions", "N123,344.54"),
                          ),
                        ],
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

  spendingCategoriesContainer(String categoriesName, String details, String price){
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: categoriesName == "Transfer"? const Color(0xFFF55353) :
                      categoriesName == "Airtime"?const Color(0xFF2095BE) :
                      categoriesName == "Data"?const Color(0xFF3068A4) :
                      categoriesName == "Savings"?const Color(0xFF18873D) : null
                ),
              ),
              const SizedBox(width: 16,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoriesName,
                    style:TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF151920).withOpacity(0.8)
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    details,
                    textAlign: TextAlign.start,
                    style:TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF151920).withOpacity(0.8)
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                price,
                textAlign: TextAlign.start,
                style:TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF151920).withOpacity(0.8)
                ),
              ),
              const SizedBox(width: 42.59,),
              const Icon(
                Icons.chevron_right_outlined,
                color: Color(0xFF323232),
                size: 10,
              )
            ],
          )
        ],
      ),
    );
  }
  // Charts Data
  List<Color> gradientColors = [
    const Color(0xffe68823),
    const Color(0xffe68823),
  ];
  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: true,
          horizontalInterval: 1.6,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              dashArray: const [3, 3],
              color: const Color(0xff37434d).withOpacity(0.2),
              strokeWidth: 2,
            );
          },
          drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'MAR';
              case 4:
                return 'JUN';
              case 7:
                return 'SEP';
              case 10:
                return 'OCT';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),

          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                      radius: 8,
                      color: [
                        Colors.black,
                        Colors.black,
                      ][index],
                      strokeWidth: 2,
                      strokeColor: Colors.black,
                    ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}0.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),

              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded ? [
            FlSpot(0, 3),
            FlSpot(2.4, 2),
            FlSpot(4.4, 3),
            FlSpot(6.4, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 4),
            FlSpot(11, 5),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0)
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [
                Color(0xffe68823).withOpacity(0.1),
                Color(0xffe68823).withOpacity(0),
              ]
          ),
        ),
        LineChartBarData(
          spots: _isLoaded ? [
            FlSpot(0, 4),
            FlSpot(2.4, 3),
            FlSpot(4.4, 5),
            FlSpot(6.4, 3.8),
            FlSpot(8, 3.8),
            FlSpot(9.5, 5),
            FlSpot(11, 5),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0)
          ],
          isCurved: true,
          colors: [
            Color(0xff4e65fe).withOpacity(0.5),
            Color(0xff4e65fe).withOpacity(0),
          ],
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blue.withOpacity(0),
              ]
          ),
        ),
      ],
    );
  }
}
