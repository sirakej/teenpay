import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';

class TransactionDetails extends StatefulWidget {

  static const String id = 'TransactionDetails';
  const TransactionDetails({
    Key? key,
  }) : super(key: key);

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
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

                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF161616),
                    size: 39,
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Transaction',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)
                  ),
                ),
              ),
              const SizedBox(height: 32,),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: const Color(0xFF00A912).withOpacity(0.2)
                  ),
                  child: const Text(
                    'Nov 22, 2021 at 11:30 PM',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF161616)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Center(
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF8DBCE),
                  ),
                  child: Center(
                    child: Image.asset("images/dummy.png",width: 49.61,height: 49.61 ,fit: BoxFit.contain,),
                  ),
                ),
              ),
              const SizedBox(height: 14,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Amount',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                'N22,000',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Receipt',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                'Oripeloye Timilehin',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                'Airtime and Data fee',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                'Done',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Session ID',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                '268248437494793493497493',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Fees/Charges',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF161616)
                                ),
                              ),
                              Text(
                                'N3.00',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF161616)
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:24),
                        ],
                      ),
                      const SizedBox(height: 90,),
                      MaterialButton(
                        onPressed:(){
                          //Navigator.pushNamed(context, TargetSavingsTwo.id);
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
                              'Share ',
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                          ),
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

  transactionContainer(String status,String name, String time,String day,String money){
    return Row(
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
    );
  }
}
