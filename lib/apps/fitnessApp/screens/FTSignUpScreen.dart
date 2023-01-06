import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/components/FTdropDownWidget.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSignInScreen.dart';
import 'package:mighty_ui_kit/main.dart';


class FTSignUpScreen extends StatefulWidget {
  @override
  _FTSignUpScreen createState() => _FTSignUpScreen();
}

class _FTSignUpScreen extends State<FTSignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 35),
                  Text(
                    'PERSONAL INFORMATION',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    showCursor: true,
                   // autofocus: true,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    showCursor: true,
                    controller: lastnameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                  SizedBox(height: 15),
                  Text('Gender',style: TextStyle(letterSpacing: 0.5,color: Colors.grey[700],fontSize: 16),),
                  Drop(),
                  SizedBox(height: 5),
                  TextField(
                    showCursor: true,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'E-mail Address'),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    showCursor: true,
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return FTSignInScreen();
                    }));
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color:appStore.isDarkModeOn ?Colors.white:Colors.blue),
                  ),
                ),
                Container(
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return FTPasswordScreen();
                      }));
                    },
                    child: Text('NEXT STEP'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn?Theme.of(context).cardColor:Colors.redAccent),
                        shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
