import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSignInScreen.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:nb_utils/nb_utils.dart';


class
FTSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(appStore.isDarkModeOn ?Theme.of(context).scaffoldBackgroundColor:Colors.red);

    return SplashScreenView(
      navigateRoute: FTSignInScreen(),
      duration: 5000,
      text: "OVERRUN",
      textStyle: GoogleFonts.righteous(
        textStyle: TextStyle(letterSpacing: 1.5,
            fontSize: 40.0,
            color: Colors.white
        ),
      ),
      backgroundColor: appStore.isDarkModeOn?Theme.of(context).scaffoldBackgroundColor:Colors.red,
    );
  }
}
