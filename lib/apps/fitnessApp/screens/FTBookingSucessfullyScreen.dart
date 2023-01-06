import 'package:flutter/material.dart';
import 'dart:math';



class FTBookingSuccessfullyScreen extends StatefulWidget {
  @override
  _FTBookingSuccessfullyScreenState createState() => _FTBookingSuccessfullyScreenState();
}

class _FTBookingSuccessfullyScreenState extends State<FTBookingSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        )
      ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Theme.of(context).iconTheme.color,),
          onPressed: () => Navigator.pop(context)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.network(
            'https://cdn.shopify.com/s/files/1/0012/3640/2231/products/Korea_Avenue_Sportsbra_Grey_2_800x.jpg?v=1555582880',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: height - 475,
            right: width - 310,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle: (-pi / 4),
                child: Container(
                  height: 560,
                  width: 480,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(26.0), topRight: Radius.circular(40.0)),
                  ),
                  child: Transform.rotate(
                    angle: (pi / 4),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Text(
                            'BOOKING',
                            style: TextStyle(

                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 125.0),
                          child: Text(
                            'SUCCESSFUL!',
                            style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                       SizedBox(height: 90.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 125),
                          child: Text(
                            'PRIVATE YOGA CLASS',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 36),
                          child: Text(
                            'Msmof Fitness',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 128),
                          child: Text(
                            'Thurs,May 8-5:30am - 7:00am',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Divider(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: ListTile(
                            title: Text('Lalisa Pitts'),
                            leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(25)),
                              child: Image(
                                image: NetworkImage('https://i.pinimg.com/736x/c1/bf/df/c1bfdf0b97b23eedcaa24fa75e9f75f1.jpg'),
                              ),
                            ),
                            subtitle: Text(
                              'View info and schedule',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
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
