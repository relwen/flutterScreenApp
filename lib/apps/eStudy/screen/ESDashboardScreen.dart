import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/fragment/ESChatFragment.dart';
import 'package:mighty_ui_kit/apps/eStudy/fragment/ESCourseFragment.dart';
import 'package:mighty_ui_kit/apps/eStudy/fragment/ESHomeFragment.dart';
import 'package:mighty_ui_kit/apps/eStudy/fragment/ESProfileFragment.dart';
import 'package:mighty_ui_kit/apps/eStudy/fragment/ESSearchFragment.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

class ESDashboardScreen extends StatefulWidget {
  @override
  ESDashboardScreenState createState() => ESDashboardScreenState();
}

class ESDashboardScreenState extends State<ESDashboardScreen> {
  List<Widget> pages = [ESHomeFragment(), ESSearchFragment(), ESCourseFragment(), ESChatFragment(), ESProfileFragment()];
  int? currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        // selectedLabelStyle: secondaryTextStyle(color: ESPrimaryColor),
        // unselectedLabelStyle: secondaryTextStyle(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.account), label: 'Profile'),
        ],
        currentIndex: currentIndex!,
        selectedItemColor: ESPrimaryColor,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
