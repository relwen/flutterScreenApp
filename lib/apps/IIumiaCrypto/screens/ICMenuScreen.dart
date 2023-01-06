import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICMenuList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICLoginScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICSettingsScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICWalletScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ICMenuScreen extends StatefulWidget {
  @override
  _ICMenuScreenState createState() => _ICMenuScreenState();
}

class _ICMenuScreenState extends State<ICMenuScreen> {
  List<ICMenuList> list = getMenuList();

  bool email = false;
  bool phn = false;
  int? _value;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(ic_navyBlueColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(150)),
                    color: ic_navyBlueColor,
                  ),
                ),
                Column(children: [
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/iiumiaCrypto/ic_logo.jpg', height: 50),
                          8.width,
                          Text("Menu", style: boldTextStyle(color: white)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(icon: Icon(Icons.workspaces_filled, color: ic_whiteColot, size: 20), onPressed: () {}),
                          PopupMenuButton(
                            color: ic_ScafoldBgColor,
                            onSelected: (dynamic value) {
                              if (value == 1) {
                                showSupportDialog(context);
                              } else if (value == 2) {
                                showSecurityDialog(context);
                              } else if (value == 3) {
                                ICSettingsScreen().launch(context);
                              } else if (value == 5) {
                                ICLoginPage().launch(context);
                              }
                            },
                            icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time, color: ic_whiteColot),
                                    8.width,
                                    Text('Add Account', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: [
                                    Icon(Icons.support, color: ic_whiteColot),
                                    8.width,
                                    Text('Support', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: [
                                    Icon(Icons.security, color: ic_whiteColot),
                                    8.width,
                                    Text('Security', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Row(
                                  children: [
                                    Icon(Icons.settings, color: ic_whiteColot),
                                    8.width,
                                    Text('Settings', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 4,
                                child: Row(
                                  children: [
                                    Icon(Icons.request_page_outlined, color: ic_whiteColot),
                                    8.width,
                                    Text('Request', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 5,
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: ic_whiteColot),
                                    8.width,
                                    Text('Logout', style: TextStyle(color: ic_whiteColot)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/iiumiaCrypto/ic_profile.png'),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bryan Johnson', style: boldTextStyle(color: ic_whiteColot, size: 20)),
                          8.height,
                          Text('ID:36784249', style: TextStyle(color: ic_secTextColor, fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                  16.height,
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: ic_lightBlue),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: list.map((e) {
                        return Container(
                          height: 70,
                          width: 70,
                          child: Column(
                            children: [
                              IconButton(
                                icon: e.i!,
                                onPressed: () {
                                  ICWalletScreen().launch(context);
                                },
                                iconSize: 30,
                              ),
                              Text(
                                '${e.head}',
                                style: TextStyle(color: ic_whiteColot, fontSize: 10),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ]).paddingAll(16)
              ],
            ),
            16.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Two-step Verification', style: boldTextStyle(color: white)),
                SwitchListTile(
                  title: Text('Email', style: boldTextStyle(color: ic_whiteColot)),
                  value: email,
                  onChanged: (bool value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                Divider(thickness: 2),
                SwitchListTile(
                  title: Text('Phone', style: boldTextStyle(color: ic_whiteColot)),
                  value: phn,
                  onChanged: (bool value) {
                    setState(() {
                      phn = value;
                    });
                  },
                ),
                16.height
              ],
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
    );
  }
}

showSupportDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return dialogWidget(
        image: 'images/iiumiaCrypto/ic_pgv2.png',
        title: 'Support',
        subTitle: 'Please write what we need to support , we will be in touch as soon as possible to help you',
        hintText: "Type you want support",
        btnTExt: "Send",
        onTap: () {
          finish(context);
        },
      );
    },
  );
}

showSecurityDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return dialogWidget(
        image: 'images/iiumiaCrypto/ic_pgv3.png',
        title: 'Security',
        subTitle: 'Verify your phone number to secure your account',
        hintText: "Phone Number",
        btnTExt: "Send",
        onTap: () {
          finish(context);
        },
      );
    },
  );
}
