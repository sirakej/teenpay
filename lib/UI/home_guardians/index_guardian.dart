import 'package:flutter/material.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/manage_activities.dart';
import 'bottom_nav_guardians/more.dart';
import 'bottom_nav_guardians/settings_guardian/settings_guardian.dart';
import 'bottom_nav_guardians/wallet_guardian/wallet_guardians.dart';

import 'bottom_nav_guardians/home_guardians/home_guardians.dart';

class IndexGuardian extends StatefulWidget {

  static const String id = 'IndexGuardian';

  const IndexGuardian({Key? key}) : super(key: key);

  @override
  _IndexGuardianState createState() => _IndexGuardianState();
}

class _IndexGuardianState extends State<IndexGuardian> {

  /// Current index of the bottom navigation
  int currentIndex = 0;

  getPage(int index) {
    switch (index){
      case 0:
        return const HomeGuardians();
        break;
      case 1:
        return  const WalletGuardians();
        break;
      case 2:
        return  Container();
        break;
      case 3:
        return  const SettingsGuardians();
        break;
      case 4:
        return const More();
        break;
      default:
        return const HomeGuardians();
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