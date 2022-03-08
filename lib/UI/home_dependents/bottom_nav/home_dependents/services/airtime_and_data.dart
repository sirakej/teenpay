import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/airtime_and_data_tab/airtime.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'airtime_and_data_tab/data.dart';

class AirtimeAndData extends StatefulWidget {
  static const String id = 'AirtimeAndData';
  const AirtimeAndData({Key? key}) : super(key: key);

  @override
  _AirtimeAndDataState createState() => _AirtimeAndDataState();
}

class _AirtimeAndDataState extends State<AirtimeAndData> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                  'Airtime & Data',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              TabBar(
                  controller: _tabController,
                  indicatorColor: const Color(0xFF3068A4),
                  isScrollable: false,
                  labelColor: const Color(0xFF3068A4),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  unselectedLabelColor: const Color(0xFF151920).withOpacity(0.32),
                  tabs:const [
                    Tab(
                      text: 'Airtime',
                    ),
                    Tab(
                      text: 'Data',
                    ),
                  ]
              ),
              Container(
                width: SizeConfig.screenWidth,
                height: 0.7,
                color: const Color(0xFF151920).withOpacity(0.32),
              ),
              Expanded(
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    //color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children:const [
                      AirtimeDependents(),
                      DataDependents(),

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
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
