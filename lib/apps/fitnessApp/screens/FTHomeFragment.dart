import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/components/FTCommanListWidget.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/modal/FTBeautyEventModel.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTBeautyScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTBookingScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTEventsScreen.dart';
import 'package:mighty_ui_kit/main.dart';

class FTHomeFragment extends StatefulWidget {
  const FTHomeFragment({Key? key}) : super(key: key);

  @override
  _FTHomeFragmentState createState() => _FTHomeFragmentState();
}

class _FTHomeFragmentState extends State<FTHomeFragment> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .75,
              width: width,
              child: Stack(fit: StackFit.loose, children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://s1.1zoom.me/big3/821/Roads_Fitness_Run_Back_view_Brunette_girl_578820_2560x1440.jpg'), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Opacity(
                      opacity: 0.75,
                      child: Container(
                          height: 50,
                          width: width - 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0, left: 20, top: 5, right: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: textEditingController,
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Search Something',
                                //hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text('WELCOME BACK!',
                              style: GoogleFonts.ribeyeMarrow(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                wordSpacing: 2,
                                letterSpacing: 1,
                                fontSize: 32,
                              ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 25),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'JENNIE',
                            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5) // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return FTBeautyScreen();
                                        }));
                                      },
                                      child: Text('BEAUTY', style: TextStyle(fontSize: 17, color: Colors.black))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return FtCommanListWidget(title: 'Concerts', list: beautyList);
                                        }));
                                      },
                                      child: Text('CONCERTS', style: TextStyle(fontSize: 17, color: Colors.black))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return FTEventsScreen();
                                        }));
                                      },
                                      child: Text('EVENTS', style: TextStyle(fontSize: 17, color: Colors.black))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return FtCommanListWidget(title: 'Fitness', list: beautyList);
                                        }));
                                      },
                                      child: Text('FITNESS', style: TextStyle(fontSize: 17, color: Colors.black))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return FtCommanListWidget(title: 'Classes', list: beautyList);
                                        }));
                                      },
                                      child: Text('CLASSES', style: TextStyle(fontSize: 17, color: Colors.black))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return FtCommanListWidget(title: 'Wellness', list: beautyList);
                                        }));
                                      },
                                      child: Text('WELLNESS', style: TextStyle(fontSize: 17, color: Colors.black))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(height: 25),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('https://wallpaperaccess.com/full/1484361.jpg')),
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        //bottomRight: Radius.circular(40.0),
                      )),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          'PRIVATE YOGA CLASS',
                          style: GoogleFonts.ribeyeMarrow(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 1.5, letterSpacing: 1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          'LIMITED TRAINING',
                          style: GoogleFonts.libreBaskerville(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, wordSpacing: 1.5, letterSpacing: 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 8),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.red),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return FTBookingScreen();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                              child: Text('BOOK NOW'),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'SUGGESTED CLASS',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                                    return FtCommanListWidget(
                                      title: 'classes',
                                      list: beautyList,
                                    );
                                  }));
                                },
                                child: Text(
                                  'See All',
                                  style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.red),
                                )),
                          )
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Precision Run', style: TextStyle(fontWeight: FontWeight.bold, wordSpacing: 1.5, fontSize: 18)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('Ashley Underwood', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('22 May,6:30-7:20 am', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('Greenwich Ave', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                      Divider(
                        color: Colors.grey,
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Precision Run', style: TextStyle(fontWeight: FontWeight.bold, wordSpacing: 1.5, fontSize: 18)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('Ashley Underwood', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('22 May,6:30-7:20 am', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text('Greenwich Ave', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                          )),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 15),
                    child: Text('SPREAD THE LOVE',
                        style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(wordSpacing: 1, fontSize: 22, fontWeight: FontWeight.w900),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15),
                    child: Text('Invite a friend & get \$20', style: TextStyle(wordSpacing: 1.5, fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('INVITE A FRIEND'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
