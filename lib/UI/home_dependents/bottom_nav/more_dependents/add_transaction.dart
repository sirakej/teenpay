import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_dependents.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_money_container.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class AddTransaction extends StatefulWidget {
  static const String id = 'AddTransaction';
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _transactionTitleController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _transactionAmountController = TextEditingController();

  bool income = false;
  bool expenses= false;
  bool foodAndDrinks= false;
  bool transport= false;
  bool housing= false;
  bool others= false;
  String placeHolder = "";
  String placeHolderTwo = "";

  void change(String given){
    setState((){placeHolder =given;});
  }
  void changeTwo(String given){
    setState((){placeHolderTwo =given;});
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
                    'Add Transaction',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF161616)
                    ),
                  ),
                ),
                const SizedBox(height: 37,),
                Center(
                  child:Text(
                    'Please add your budget',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF151920).withOpacity(0.8)
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 80,),
                          Padding(
                            padding:const EdgeInsets.only(left: 16,right: 16),
                            child: _transactionForm(),
                          ),
                          const SizedBox(height: 40,),
                          MaterialButton(
                            onPressed:(){
                              Navigator.pushNamedAndRemoveUntil(context, BudgetMoneyContainer.id, (route) => false);
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
                                  'Add transaction',
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
  Widget _transactionForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Budget Title",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _transactionTitleController,
                    keyboardType:TextInputType.name ,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your target title';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Expenses",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Public Sans',
                  fontSize: 14,
                  color: Color(0xFF161616),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: TextFormField(
                    controller: _transactionAmountController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your overall amount';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Public Sans',
                      color: Color(0xFF161616),
                    ),
                    decoration:MyConstants.formInputDecoration
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
                'Select Category',
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
                onTap: _selectCategoryShowModalSheet,
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
                          placeHolderTwo == null? "":placeHolderTwo,
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
                'Transaction Type',
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
                onTap: _TransactionTypeShowModalSheet,
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
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _TransactionTypeShowModalSheet(){
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
                              'Transaction Type',
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
                                  income = true;
                                  expenses= false;
                                  change("Income");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  income == false? Icon(
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
                                    'Income',
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
                                  income = false;
                                  expenses= true;
                                  change("Expenses");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  expenses == false? Icon(
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
                                    'Expenses',
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

  // ignore: non_constant_identifier_names
  _selectCategoryShowModalSheet(){
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
                              'Select Category',
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
                                  foodAndDrinks= true;
                                  transport= false;
                                  housing= false;
                                  others= false;
                                  changeTwo("Food & Drinks");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  foodAndDrinks == false? Icon(
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
                                    'Food & Drinks',
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
                                  foodAndDrinks= false;
                                  transport= true;
                                  housing= false;
                                  others= false;
                                  changeTwo("Transport");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  transport == false? Icon(
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
                                    'Transport',
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
                                  foodAndDrinks= false;
                                  transport= false;
                                  housing= true;
                                  others= false;
                                  changeTwo("Housing");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  housing == false? Icon(
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
                                    'Housing',
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
                                  foodAndDrinks= false;
                                  transport= false;
                                  housing= false;
                                  others= true;
                                  changeTwo("Others");
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  others == false? Icon(
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
                                    'Others',
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
