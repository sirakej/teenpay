import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'add_transaction.dart';
import 'budget_money_container_tab/expenses.dart';
import 'budget_money_container_tab/income.dart';

class BudgetMoneyContainer extends StatefulWidget {

  static const String id = 'BudgetMoneyContainer';
  const BudgetMoneyContainer({
    Key? key,
  }) : super(key: key);

  @override
  _BudgetMoneyContainerState createState() => _BudgetMoneyContainerState();
}

class _BudgetMoneyContainerState extends State<BudgetMoneyContainer> with SingleTickerProviderStateMixin{
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
              Column(
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
                ],
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
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expenses',
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
                      Income(),
                      Expenses(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: const Color(0xFF3068A4),
        child: const Icon(
          Icons.add,
          size: 16,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddTransaction.id);
        },
      ),
    );
  }
}
