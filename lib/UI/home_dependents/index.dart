import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependants.dart';
import 'bottom_nav/more_dependents/more_dependents.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/settings_dependants/settings_dependants.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/wallet_dependants.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/settings_guardian.dart';

import 'bottom_nav/analytics_dependent/analytics_dependants.dart';

class Index extends StatefulWidget {

  static const String id = 'Index';

  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  /// Current index of the bottom navigation
  int currentIndex = 0;

  getPage(int index) {
    switch (index){
      case 0:
        return  const HomeDependants();
        break;
      case 1:
        return  const WalletDependants();
        break;
      case 2:
        return  const Analytics();
        break;
      case 3:
        return  const SettingsDependants();
        break;
      case 4:
        return  const MoreDependent();
        break;
      default:
        return  Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getPage(currentIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF3068A4),
              fontSize: 10,
              fontWeight: FontWeight.w400
          ),
          unselectedLabelStyle:TextStyle(
              fontFamily: 'Poppins',
              color: const Color(0xFF151920).withOpacity(0.8  ),
              fontSize: 10,
              fontWeight: FontWeight.w400
          ),
          onTap: onTabTapped,
          items: [
            _barItem("home_inactive", "Home","home_icon"),
            _barItem("wallet_inactive", "Wallet","wallet_active"),
            _barItem("analytics_inactive", "Analytics","analytics_active"),
            _barItem("settings_inactive", "Settings","settings_active"),
            _barItem("more", "More","more"),

          ],
        ),
      ),
    );
  }

  /// Navigating to other bottom tabs
  void onTabTapped(int index) {
    if(!mounted){
      return;
    }
    else {
      setState(() { currentIndex = index; });
    }
  }

  BottomNavigationBarItem _barItem(String image, String text,String active){
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 7,top: 16),
        child: Image.asset(
          "images/$image.png",
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 7,top: 16),
        child: Image.asset(
          'images/$active.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      label: text,
    );
  }

}