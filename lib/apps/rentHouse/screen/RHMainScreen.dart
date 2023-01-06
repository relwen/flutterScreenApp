import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHMainScreen extends StatefulWidget {
  static String tag = '/RHMainScreen';

  @override
  RHMainScreenState createState() => RHMainScreenState();
}

class RHMainScreenState extends State<RHMainScreen> with TickerProviderStateMixin {
  String? title;

  // MotionTabController tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // tabController = MotionTabController(initialIndex: 0, vsync: this, length: 5);
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    if (appStore.isDarkModeOn) {
      setStatusBarColor(scaffoldSecondaryDark, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    }
    //  tabController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //TODO MotionTabBar Without NullSafety
      /*  bottomNavigationBar: MotionTabBar(
        labels: ["Explore", "Roommates", "Location", "Chat", "Account"],
        initialSelectedTab: "Explore",
        tabIconColor: Colors.grey[300],
        tabSelectedColor: appPrimaryColor,
        onTabItemSelected: (int value) {
          setState(() {
            tabController.index = value;
          });
        },
        icons: [
          Icons.home,
          Icons.people,
          Icons.location_on,
          Icons.chat,
          Icons.settings,
        ],
        textStyle: boldTextStyle(color: appPrimaryColor, size: 11),
      ),
      body: MotionTabBarView(
        controller: tabController,
        children: <Widget>[
          RHDashBoardScreen(),
          RHRoommatesScreen(),
          RHLocationScreen(),
          RHInboxScreen(),
          RHAccountScreen(),
        ],
      ),*/
    );
  }
}
