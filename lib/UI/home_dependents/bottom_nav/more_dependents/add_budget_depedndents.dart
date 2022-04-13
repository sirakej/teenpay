import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_dependents.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';


class AddBudgetDependents extends StatefulWidget {
  static const String id = 'AddBudgetDependents';
  const AddBudgetDependents({Key? key}) : super(key: key);

  @override
  _AddBudgetDependentsState createState() => _AddBudgetDependentsState();
}

class _AddBudgetDependentsState extends State<AddBudgetDependents> {
  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final _formKey = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _budgetTitleController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController _totalExpensesController = TextEditingController();


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
                    'Budget',
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
                            child: _budgetForm(),
                          ),
                          const SizedBox(height: 40,),
                          MaterialButton(
                            onPressed:_ShowModalSheet,
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
                                  'Create Budget',
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
  Widget _budgetForm() {
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
                height: 50,
                child: TextFormField(
                    controller: _budgetTitleController,
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
                height: 50,
                child: TextFormField(
                    controller: _totalExpensesController,
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
          const SizedBox(height: 40),
        ],
      ),
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
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),
                      const Text(
                        'Budget Created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF161616),
                        ),
                      ),
                      const SizedBox(height:45,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF18873D).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 22,
                            color: Color(0xFF18873D),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28,),
                      Text(
                        'Your budget is ready, start adding income\nand expenses',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF151920).withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 38,),
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return const BudgetDependents(populate:true);}));
                        },
                        child:Container(
                          width: 151,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.transparent,
                              border:Border.all(
                                  color: const Color(0xFF335491),
                                  width: 1
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Center(
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF335491),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:82)
                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}
