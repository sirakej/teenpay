import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/transaction_details.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class Income extends StatefulWidget {

  static const String id = 'Income';
  const Income({
    Key? key,
  }) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
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
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24,),
                    transactionContainer("Cancel","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Cancel","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Cancel","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Pending","Adekunle Jacobs", "09:45 AM","Today", "N50,000.00"),
                    const SizedBox(height: 24,),
                    transactionContainer("Successful","Kolade Awaye", "09:45 AM","Today", "N50,000.00"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  transactionContainer(String status,String name, String time,String day,String money){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, TransactionDetails.id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              status == "Successful"? Container(
                height: 32,
                width: 32,
                decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF18873D).withOpacity(0.1)
                ),
                child: Center(
                  child: Image.asset("images/successful.png",width: 18,height: 10.41,fit: BoxFit.contain,),
                ),
              ):
              Container(
                height: 32,
                width: 32,
                decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF313D).withOpacity(0.1)
                ),
                child: Center(
                  child: Image.asset("images/fail.png",width: 18,height: 10.41,fit: BoxFit.contain,),
                ),
              ),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                    const TextStyle(
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFF161616)
                    ),
                  ),
                  const SizedBox(height: 9,),
                  Text(
                    "$time . $day",
                    style:
                    TextStyle(
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: const Color(0xFF161616).withOpacity(0.5)
                    ),
                  ),

                ],
              ),
            ],
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  money,
                  style:
                  const TextStyle(
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF161616)
                  ),
                ),
                const SizedBox(height: 9,),
                Text(
                    status,
                    style:
                    TextStyle(
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: status == "Pending"?const Color(0xFFC6720F):
                        status == "Successful"?const Color(0xFF18873D):
                        status == "Cancelled"?const Color(0xFFF55353):null
                    )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
