import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPaymentMethodScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECShippingInfoScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCartTabBarPage extends StatefulWidget {
  const ECCartTabBarPage({Key? key}) : super(key: key);

  @override
  _ECCartTabBarPageState createState() => _ECCartTabBarPageState();
}

class _ECCartTabBarPageState extends State<ECCartTabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldDarkColor : white,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    );
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
        title: Text('Cart', style: boldTextStyle(size: ecTitleSize)),
        leading: IconButton(
            icon: Icon(Icons.clear, size: ecIconSize.toDouble(), color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        height: context.height(),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: ec_seaBlue,
              labelColor: appStore.isDarkModeOn ? white : darkBlue,
              unselectedLabelColor: Colors.grey,
              onTap: (index) {},
              tabs: [
                Tab(text: 'Your cart'),
                Tab(text: 'Process'),
                Tab(text: 'Draft Order'),
                Tab(text: 'History'),
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: [
                ECHistoryScreen(),
                AppButton(
                    color: darkSlateBlue,
                    height: 70,
                    child: Text('Click here to view to Shipping Status', style: boldTextStyle(color: white)),
                    onTap: () {
                      ECShippingInfoScreen().launch(context);
                    }),
                AppButton(
                    color: darkSlateBlue,
                    height: 70,
                    child: Text('Click here to proceed to Payment Screen', style: boldTextStyle(color: white)),
                    onTap: () {
                      ECPaymentMethodScreen().launch(context);
                    }),
                ECHistoryScreen(),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
