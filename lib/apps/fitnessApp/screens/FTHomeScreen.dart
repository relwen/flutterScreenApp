import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/components/FTActiveIconWidget.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTAddCardTabScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTHomeFragment.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTInfoTabScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTMyFavTabScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSettingsTabScreen.dart';

class FTHomeScreen extends StatefulWidget {
  @override
  _FTHomeScreenState createState() => _FTHomeScreenState();
}

class _FTHomeScreenState extends State<FTHomeScreen> {
  List<Widget> widgets = [FTHomeFragment(), FTAddCardScreen(), FTInfoTabScreen(), FTMyFavTabScreen(), FTSettingsTabScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: widgets[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 12),
            currentIndex: currentIndex,
            // onTap: _changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10,

            unselectedFontSize: 10,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey[500],
            showUnselectedLabels: false,

            showSelectedLabels: false,
            onTap: (index) {
              currentIndex = index;

              setState(() {});
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: FTActiveIconWidget(title: '  Home', icon: Icon(Icons.home, color: Colors.white)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                activeIcon: FTActiveIconWidget(title: '   Card   ', icon: Icon(Icons.credit_card, color: Colors.white)),
                label: 'android',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                activeIcon: FTActiveIconWidget(title: '   Info   ', icon: Icon(Icons.info, color: Colors.white)),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                activeIcon: FTActiveIconWidget(title: 'Faviourites', icon: Icon(Icons.favorite, color: Colors.white)),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: FTActiveIconWidget(title: 'Account', icon: Icon(Icons.account_circle_outlined, color: Colors.white)),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
