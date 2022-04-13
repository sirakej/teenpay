import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/save_money_select.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/savings_select.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/add_budget_depedndents.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_money_container.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class BudgetDependents extends StatefulWidget {

  static const String id = 'BudgetDependents';
  final populate;
  const BudgetDependents({
    Key? key,
    required this.populate,
  }) : super(key: key);

  @override
  _BudgetDependentsState createState() => _BudgetDependentsState();
}

class _BudgetDependentsState extends State<BudgetDependents> {
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
                  'Budget',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              widget.populate == true?
              const SizedBox(height: 20,)
                  :
              SizedBox(height: SizeConfig.screenHeight!/5,),
              widget.populate == true?
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      budgetMoneyContainer(),
                      const SizedBox(height: 24,),
                      budgetMoneyContainer(),
                      const SizedBox(height: 24,),
                      budgetMoneyContainer(),
                      const SizedBox(height: 24,),
                      budgetMoneyContainer(),
                    ],
                  ),
                ),
              )
                  :
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Image.asset("images/empty_budget.png",width: 128,height: 128,fit: BoxFit.contain,),
                    const SizedBox(height: 35.99,),
                    Text(
                      'No budget has been created so far',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF151920).withOpacity(0.8)
                      ),
                    ),
                    Text(
                      'Kindly click on the button below to your budget',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF151920).withOpacity(0.8)
                      ),
                    ),
                  ],
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
          Navigator.pushNamed(context, AddBudgetDependents.id);
        },
      ),
    );
  }

  budgetMoneyContainer(){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BudgetMoneyContainer.id);
      },
      child: Container(
        width: SizeConfig.screenWidth,
        height: 164,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 4,
                  blurRadius: 20,
                  offset: const Offset(0,8),
                  color: const Color(0xFFAFAFAF).withOpacity(0.1)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  color: const Color(0xFF444444),
                  itemBuilder:(context) => [
                    const PopupMenuItem(
                      child: Text("Manage Activities"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Transactions"),
                      value: 2,
                    )
                  ],

                ),
              ],
            ),
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
            const SizedBox(height: 24,),
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
            )
          ],
        ),
      ),
    );
  }
}
