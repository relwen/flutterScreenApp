import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCodeBrandScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECTimingScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECNotificationsScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECPromoTabBarPage extends StatefulWidget {
  const ECPromoTabBarPage({Key? key}) : super(key: key);

  @override
  _ECPromoTabBarPageState createState() => _ECPromoTabBarPageState();
}

class _ECPromoTabBarPageState extends State<ECPromoTabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    _tabController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        leading: commonCachedNetworkImage(ec_logo, fit: BoxFit.cover),
        title: Text('Promo', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            onPressed: () {
              ECProductTabBarPage().launch(context);
            },
            icon: Icon(Feather.shopping_bag, size: ecIconSize.toDouble()),
          ),
          IconButton(
            onPressed: () {
              ECNotificationsScreen().launch(context);
            },
            icon: Icon(Fontisto.bell, size: ecIconSize.toDouble()),
          ),
          IconButton(
            onPressed: () {
              ECCartTabBarPage().launch(context);
            },
            icon: Icon(MaterialCommunityIcons.cart_outline, size: ecIconSize.toDouble()),
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: ec_seaBlue,
            labelColor: appStore.isDarkModeOn ? white : darkBlue,
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {},
            tabs: [
              Tab(text: 'Code Effective'),
              Tab(text: 'Latest Coded'),
              Tab(text: 'About Expire'),
              Tab(text: 'Code Brand'),
            ],
          ),
          TabBarView(
            controller: _tabController,
            children: [
              ECTimingScreen(),
              ECTimingScreen(),
              ECTimingScreen(),
              ECCodeBrandScreen(),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
