  import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';

class FTInfoTabScreen extends StatefulWidget {
  @override
  _FTInfoTabScreenState createState() => _FTInfoTabScreenState();
}

class _FTInfoTabScreenState extends State<FTInfoTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                  ),
                  child: Image.network(
                    'https://us.123rf.com/450wm/puhhha/puhhha1510/puhhha151001052/45823409-woman-meditating-and-doing-yoga-against-white-background.jpg?ver=6',
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
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
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            color: Theme.of(context).cardColor.withOpacity(0.8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.0),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'GYM CLASSES',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 10),
                                  child: Text(
                                    'CROSS FIT',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                                  )),
                              SizedBox(height: 20.0),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Thurs,June 10,5:30am',
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  )),
                              SizedBox(
                                height: 14,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Note',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 10),
                                child: TextField(
                                  decoration: InputDecoration(hintText: 'Write Something'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Request Submitted'),
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 30),
                      child: Text('SEND REQUEST'),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn?Theme.of(context).cardColor:Colors.red),
                        shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
