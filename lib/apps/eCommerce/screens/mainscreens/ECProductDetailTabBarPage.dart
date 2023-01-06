import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECOverviewScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPostReviewScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECProductDetailTabBarPage extends StatefulWidget {
  const ECProductDetailTabBarPage({Key? key}) : super(key: key);

  @override
  _ECProductDetailTabBarPageState createState() => _ECProductDetailTabBarPageState();
}

class _ECProductDetailTabBarPageState extends State<ECProductDetailTabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;
  int counter = 0;
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  List cols = [lightBlue, ec_lightRed, black, purple, yellow];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Product Detail', style: boldTextStyle(color: appStore.isDarkModeOn ? white : scaffoldDarkColor, size: ecTitleSize)),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: ec_seaBlue,
              labelColor: appStore.isDarkModeOn ? white : darkBlue,
              unselectedLabelColor: Colors.grey,
              onTap: (index) {},
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Details Description'),
              ],
            ),
          ),
          TabBarView(
            controller: _tabController,
            children: [
              ECOverviewScreen(),
              ECPostReviewScreen(),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
