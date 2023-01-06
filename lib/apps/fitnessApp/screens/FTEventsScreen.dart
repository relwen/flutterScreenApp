import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTPaymentScreen.dart';
import 'package:mighty_ui_kit/main.dart';

class FTEventsScreen extends StatefulWidget {
  @override
  _FTEventsScreenState createState() => _FTEventsScreenState();
}

class _FTEventsScreenState extends State<FTEventsScreen> {
  var testdata = [
    'Access to a wide range of genuine fashion products',
    'Very affordable prices',
    'User friendly website for easy ',
    'online and offline presence',
    'Fraud Risk free transactions',
    'Nation wide delivery'
  ];

  @override
  Widget build(BuildContext context) {
    final _markDownData = testdata.map((e) => "- $e \n").reduce((x, y) => "$x$y");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        elevation: 0.0,
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: height * 0.7,
                ),
                Container(
                  height: height * 0.6,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://images.wallpapersden.com/image/download/emma-roberts-lovely-smile-wallpapers_aWpsbW2UmZqaraWkpJRnbmhnrWduaGc.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
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
                          offset: Offset(0, 5), // changes position of shadow
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
                          height: height * 0.2,
                          width: width - 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      color: Colors.white,
                                      child: Image(
                                        image: NetworkImage('https://t3.ftcdn.net/jpg/02/83/26/48/360_F_283264892_8iJP372Mrn4YzXugVF9KfzaUMpGUDsHB.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'MSMOF EVENT',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, wordSpacing: 1.5),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text('44 Swanson Dr.Hamden', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text('8:00 am - 11:00am', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text('\$150', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, wordSpacing: 1.5)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: width - 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      'FASHION EVENTS',
                      style: GoogleFonts.londrinaOutline(textStyle: TextStyle(fontSize: 28, letterSpacing: 2, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'CHANEL CRUISE VIBES',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you want eyeballs on you while',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                        Text(
                          'you grace the streets with your',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                        Text(
                          'presence?',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DO YOU HAVE THE DESIRE OF',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        Text(
                          'BEING THE BEST DRESSED',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        Text(
                          'IN THE ROOM?',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'With the trust bing the pillar of our',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                        Text(
                          'business we guarantee our customers',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                        Text(
                          'of the following.',
                          style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'WHAT\'S INCLUDED?',
                      style: TextStyle(wordSpacing: 1.5, fontWeight: FontWeight.bold, fontSize: 16),
                      softWrap: true,
                    ),
                  ),
                  Column(
                    children: [
                      Markdown(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        data: _markDownData,
                        styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(textTheme: TextTheme(bodyText2: TextStyle(fontSize: 17.0, color: Colors.black)))),
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red),
                    shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return FTPaymentScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 34, top: 12, bottom: 12),
                  child: Text('BUT TICKETS'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
