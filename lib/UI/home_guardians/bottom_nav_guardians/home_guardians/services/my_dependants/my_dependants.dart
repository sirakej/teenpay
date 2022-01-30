import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/size_config.dart';
import '../transactions.dart';
import 'add_dependent.dart';

class MyDependants extends StatefulWidget {
  static const String id = 'MyDependants';
  const MyDependants({Key? key}) : super(key: key);

  @override
  _MyDependantsState createState() => _MyDependantsState();
}

class _MyDependantsState extends State<MyDependants> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Dependants',
                      style: TextStyle(
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
              SizedBox(height: SizeConfig.screenHeight!/5,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("images/empty_dependants.png",width: 156,height: 156,fit: BoxFit.contain,),
                    const SizedBox(height: 35.99,),
                    const Text(
                      'No Dependant has been added so far',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3068A4)
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const Text(
                      'Kindly click on the button below to add your dependant\nor children',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF161616)
                      ),
                    ),
                  ],
                ),
              ),
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
          Navigator.pushNamed(context, AddDependants.id);
        },
      ),
    );
  }
}
