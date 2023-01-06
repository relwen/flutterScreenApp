import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCollectionScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECGeneralScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCategoryTabBarPage extends StatefulWidget {
  const ECCategoryTabBarPage({Key? key}) : super(key: key);

  @override
  _ECCategoryTabBarPageState createState() => _ECCategoryTabBarPageState();
}

class _ECCategoryTabBarPageState extends State<ECCategoryTabBarPage> with TickerProviderStateMixin {
  TabController? _tabController;

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
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        title: Text('Category', style: boldTextStyle(size: ecTitleSize)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.share, size: ecIconSize.toDouble()), onPressed: () {}),
          IconButton(
            icon: Icon(Feather.shopping_cart, size: ecIconSize.toDouble()),
            onPressed: () {
              ECCartTabBarPage().launch(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: ec_seaBlue,
            labelColor: appStore.isDarkModeOn ? white : darkBlue,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {},
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'General'),
              Tab(text: 'Collection'),
            ],
          ).paddingOnly(left: 16),
          TabBarView(
            controller: _tabController,
            children: [
              ECGeneralScreen(),
              ECCollectionScreen(),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
