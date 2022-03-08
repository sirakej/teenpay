import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/airtime_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/data_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/savings_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/transfers_transaction.dart';
import 'package:stripling_wallet/utils/line_chart_sam.dart';
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
              AspectRatio(
                aspectRatio: 1.5,
                child: LinesChart(isShowingMainData: isShowingMainData)
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
}
