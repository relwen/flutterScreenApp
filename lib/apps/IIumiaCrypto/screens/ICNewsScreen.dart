import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICNewsList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICDetailScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICNewsScreen extends StatefulWidget {
  @override
  _ICNewsScreenState createState() => _ICNewsScreenState();
}

class _ICNewsScreenState extends State<ICNewsScreen> {
  PageController pageController = PageController();

  List<ICNewsList> list = getNewsList();
  List a = ['', '', '', '', '', ''];

  bool like = false;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(ic_ScafoldBgColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ic_ScafoldBgColor,
        title: Text('News', style: boldTextStyle(color: white)),
        iconTheme: IconThemeData(color: white),
        actions: [
          IconButton(
              icon: Icon(like ? Icons.bookmark_border_outlined : Icons.bookmark, color: ic_whiteColot, size: 20),
              onPressed: () {
                like = !like;
                setState(() {});
              }),
          IconButton(icon: Icon(Icons.search_outlined, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 16, left: 16),
                        decoration: boxDecorationDefault(color: ic_lightBlue),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: AssetImage('images/iiumiaCrypto/ic_profile.png')),
                                16.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('in Bitcoin eExchange ', style: TextStyle(color: ic_skip, fontSize: 15)),
                                    4.height,
                                    Text('by Jackii Sparrow ', style: TextStyle(color: ic_whiteColot, fontSize: 15)),
                                  ],
                                )
                              ],
                            ),
                            8.height,
                            Text(
                              'Bitcoin Is Back Above \$11,500. But Bulls Not Out of Woods Yet!',
                              style: boldTextStyle(color: ic_whiteColot, size: 15),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(bottom: 8, child: DotIndicator(pageController: pageController, pages: a)),
                ],
              ),
            ),
            16.height,
            ListView.separated(
                padding: EdgeInsets.only(right: 16, left: 8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var e = list[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset('${e.img}', height: 150, width: 100, fit: BoxFit.cover),
                        borderRadius: radius(),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${e.pText}', style: boldTextStyle(color: ic_whiteColot)),
                          4.height,
                          Text('${e.secText}', style: secondaryTextStyle(color: ic_whiteColot, size: 10)),
                          4.height,
                          Text('${e.thirdText}', style: secondaryTextStyle(color: ic_skip, size: 10)),
                          4.height,
                          Text('${e.forthText}', style: secondaryTextStyle(color: ic_whiteColot, size: 12), maxLines: 2, overflow: TextOverflow.ellipsis)
                        ],
                      ).expand(),
                    ],
                  ).paddingAll(8).onTap(
                    () {
                      ICDetailScreen(data: e).launch(context);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(thickness: 2),
                itemCount: list.length)
          ],
        ),
      ),
    );
  }
}
