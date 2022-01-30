import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';
import 'package:stripling_wallet/utils/size_config.dart';

import 'add_dependant_continue.dart';

class AddDependants extends StatefulWidget {
  static const String id = 'AddDependants';
  const AddDependants({Key? key}) : super(key: key);

  @override
  _AddDependantsState createState() => _AddDependantsState();
}

class _AddDependantsState extends State<AddDependants> {

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
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Add Dependants',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF161616)

                  ),
                ),
              ),
              const SizedBox(height:24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Input the child ID on the Dependant\nregistration process for Identification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color:const Color(0xFF161616).withOpacity(0.8)
                  ),
                ),
              ),
              const SizedBox(height: 48,),
            ],
          ),
        ),
      ),
    );
  }
}
