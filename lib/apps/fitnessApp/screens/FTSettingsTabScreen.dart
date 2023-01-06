import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FTSettingsTabScreen extends StatefulWidget {
  @override
  _FTSettingsTabScreenState createState() => _FTSettingsTabScreenState();
}

class _FTSettingsTabScreenState extends State<FTSettingsTabScreen> {
  bool face = true;
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://i.pinimg.com/originals/9e/0f/6b/9e0f6b31ae9ada6f4e59df27e343812e.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: height * 0.5  ,
                width: width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    color:Theme.of(context).cardColor.withOpacity(0.8)),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ListTile(
                      title: Text(
                        'NOTIFICATION',
                        style: GoogleFonts.play(),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        iconSize: 20.0,
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'TERMS OF USE',
                        style: GoogleFonts.play(),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        iconSize: 20.0,
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'PRIVACY POLICY',
                        style: GoogleFonts.play(),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        iconSize: 20.0,
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                        title: Text(
                          'FACE ID',
                          style: GoogleFonts.play(),
                        ),
                        trailing: Switch(
                          value: face,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          activeTrackColor: Colors.red,
                          inactiveTrackColor: Colors.grey,
                          onChanged: (bool value) {
                            setState(() {
                              face = value;
                            });
                          },
                        )),
                    ListTile(
                        title: Text(
                          'DARK MODE',
                          style: GoogleFonts.play(),
                        ),
                        trailing: Switch(
                          value: mode,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          activeTrackColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              mode = value;
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
