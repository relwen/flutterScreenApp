import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTPaymentScreen.dart';
import 'package:mighty_ui_kit/main.dart';

class FTBookingScreen extends StatefulWidget {
  @override
  _FTBookingScreenState createState() => _FTBookingScreenState();
}

class _FTBookingScreenState extends State<FTBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: height * 0.55,
            width: width,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  child: Image.network(
                    'https://image.freepik.com/free-photo/woman-doing-yoga-sports-lifestyle-toned-body_1157-48066.jpg',
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
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
                          spreadRadius: 7,
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
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width - 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'June 10,5:30 am . w/Lalisa Pitts',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, wordSpacing: 1.5, letterSpacing: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: width - 34,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PRIVATE YOGA CLASS',
                    style: GoogleFonts.ribeyeMarrow(textStyle: TextStyle(fontSize: 24)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'LIMITED TRAINING',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 25),
                ListTile(
                  title: Text(
                    'Lalisa Pitts',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      image: NetworkImage('https://i.pinimg.com/736x/c1/bf/df/c1bfdf0b97b23eedcaa24fa75e9f75f1.jpg'),
                    ),
                  ),
                  subtitle: Text(
                    'View info and schedule',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                Divider(height: 15, thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ABOUT THIS STUDIO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 1.5)),
                ),
                ListTile(
                  title: Text(
                    'Msmof Fitness',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      image: NetworkImage('https://t3.ftcdn.net/jpg/02/83/26/48/360_F_283264892_8iJP372Mrn4YzXugVF9KfzaUMpGUDsHB.jpg'),
                    ),
                  ),
                  subtitle: Text(
                    '44 Swanson Dr.Hamden',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                  isThreeLine: true,
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'We are a full service salon and spa,',
                            style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
                            softWrap: true,
                          ),
                          Text(
                            'delicating to providing our clients with',
                            style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
                            softWrap: true,
                          ),
                          Text(
                            'the absolute best..',
                            style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
                            softWrap: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Contact Us',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotline:+783490923',
                            style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w400),
                            softWrap: true,
                          ),
                          Text(
                            'Website:http://bymsmof.com',
                            style: TextStyle(wordSpacing: 1, color: Colors.grey, fontWeight: FontWeight.w400),
                            softWrap: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('231 Glenholme Road Allentown', softWrap: true, style: TextStyle(wordSpacing: 1.5, fontWeight: FontWeight.w400, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ? Theme.of(context).cardColor:Colors.red),
                  shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FTPaymentScreen();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                child: Text('BOOK NOW'),
              ),
            ),
          ),
          SizedBox(height: 20)
        ]),
      ),
    );
  }
}
