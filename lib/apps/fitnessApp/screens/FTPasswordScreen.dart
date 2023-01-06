import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSignInScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSignInScreen.dart';
import 'package:mighty_ui_kit/main.dart';


class FTPasswordScreen extends StatefulWidget {
  @override
  _FTPasswordScreenState createState() => _FTPasswordScreenState();
}

class _FTPasswordScreenState extends State<FTPasswordScreen> {
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  bool value = true;
  bool convalue = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text('LOGIN PASSWORD',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      color: Colors.grey,
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          value = !value;
                        });
                      },
                    )),
                controller: passController,
                obscureText: value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: conpassController,
                obscureText: convalue,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffix: IconButton(
                      color: Colors.grey,
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          convalue = !convalue;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(height: height * 0.16),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn?Theme.of(context).cardColor:Colors.redAccent),
                      shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return FTSignInScreen();
                    }));
                  },
                  child: Text('Start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
