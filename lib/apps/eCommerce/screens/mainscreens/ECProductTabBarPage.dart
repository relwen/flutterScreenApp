import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECStoreProductScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECStoreRecordScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECProductTabBarPage extends StatefulWidget {
  const ECProductTabBarPage({Key? key}) : super(key: key);

  @override
  _ECProductTabBarPageState createState() => _ECProductTabBarPageState();
}

class _ECProductTabBarPageState extends State<ECProductTabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _tabController = TabController(vsync: this, length: 4);
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldDarkColor : white,
      statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Add To Favourite', style: boldTextStyle(size: ecTitleSize)),
      ),
      body: Container(
        //  height: context.height(),
        //  width: context.width(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  commonCachedNetworkImage(
                    ec_shopping1,
                    height: 200,
                    fit: BoxFit.cover,
                    width: context.width(),
                  ).cornerRadiusWithClipRRect(16).paddingSymmetric(horizontal: 16),
                  Container(
                    height: 200,
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: Colors.black.withOpacity(0.2)),
                    width: context.width(),
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  ),
                  Column(
                    children: [
                      16.height,
                      commonCachedNetworkImage(ec_shoes8, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          productFollowerWidget(icon: Icons.bookmark, totalFollowerNum: '347k', text: 'Follower', iconColor: yellow),
                          8.width,
                          productFollowerWidget(icon: FontAwesome.cube, totalFollowerNum: '4.5k', text: 'Products', iconColor: lightSkyBlue),
                          8.width,
                          productFollowerWidget(icon: Icons.star, totalFollowerNum: '1.5k', text: 'Reviews', iconColor: khaki),
                        ],
                      ),
                      18.height,
                      AppButton(height: ecButtonHeight.toDouble(), text: 'Add to Favourites', onTap: () {}, color: appStore.isDarkModeOn ? cardDarkColor : white, elevation: 10),
                    ],
                  ).paddingOnly(top: 32),
                ],
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: ec_seaBlue,
                labelColor: appStore.isDarkModeOn ? white : darkBlue,
                unselectedLabelColor: Colors.grey,
                onTap: (index) {},
                tabs: [
                  Tab(text: 'Store'),
                  Tab(text: 'Product'),
                  Tab(text: 'Collection'),
                  Tab(text: 'Store Records'),
                ],
              ),
              Container(
                height: context.height() * 0.7,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ECStoreProductScreen(),
                    ECStoreRecordScreen(),
                    ECStoreProductScreen(),
                    ECStoreRecordScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
