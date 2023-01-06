import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTBookingSucessfullyScreen.dart';
import 'package:mighty_ui_kit/main.dart';

class FTPaymentScreen extends StatelessWidget {
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
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/charming-young-girl-embracing-herself-picture-id965048746?k=6&m=965048746&s=612x612&w=0&h=cxU3T2uavd0KnI1b7LlR7lKP6YlBH-RiIaLaRPDQbio='),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: height * 0.5,
                    width: width - 35,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(40.0), bottomRight: Radius.circular(40.0)), color: Theme.of(context).cardColor.withOpacity(0.85)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(60.0),
                                    bottomRight: Radius.circular(60.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  child: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        'https://media.istockphoto.com/photos/charming-young-girl-embracing-herself-picture-id965048746?k=6&m=965048746&s=612x612&w=0&h=cxU3T2uavd0KnI1b7LlR7lKP6YlBH-RiIaLaRPDQbio='),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('INCREDIBLE BODY ART', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('44 Swanson Dr.Hmaden', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                                  Text('8:00 am - 11:00 am', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                                  Row(
                                    children: [
                                      Text('\$1000 ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Text('x2 tickets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: Text('PAYMENT METHODS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          title: Text('VISA  **** **** **** 1112'),
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.red,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.red),
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return FTBookingSuccessfullyScreen();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                              child: Text('PAY NOW'),
                            ),
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
    );
  }
}
