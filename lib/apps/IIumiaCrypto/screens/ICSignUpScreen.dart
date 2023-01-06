import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICMainScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ICSignUp extends StatefulWidget {
  @override
  _ICSignUpState createState() => _ICSignUpState();
}

class _ICSignUpState extends State<ICSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final noController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Image.asset('images/iiumiaCrypto/ic_logo.jpg', height: 100).center(),
              16.height,
              Text('Get Started', style: TextStyle(color: ic_whiteColot, fontSize: 30, fontWeight: FontWeight.bold)).center(),
              16.height,
              Text.rich(
                TextSpan(
                  text: "Let's create your account ",
                  style: secondaryTextStyle(color: ic_whiteColot),
                  children: <TextSpan>[
                    TextSpan(text: "Privacy Policy", style: secondaryTextStyle(color: ic_skip)),
                  ],
                ),
              ).center(),
              16.height,
              Text("Name", style: secondaryTextStyle(color: ic_whiteColot)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ic_navyBlueColor,
                ),
                child: TextFormField(
                  style: TextStyle(color: ic_whiteColot),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: buildInputDecoration(
                    name: "Enter Name",
                    color: ic_whiteColot,
                    iconColor: ic_whiteColot,
                    prefixIcon: Icons.person_outline,
                  ),
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Enter Valid Name';
                    }
                    if (!RegExp("^[a-zA-Z]*").hasMatch(name)) {
                      return "Enter Valid Name";
                    }
                    return null;
                  },
                ),
              ),
              16.height,
              Text("Email", style: secondaryTextStyle(color: ic_whiteColot)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ic_navyBlueColor,
                ),
                child: TextFormField(
                  style: TextStyle(color: ic_whiteColot),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildInputDecoration(
                    name: "Enter Email",
                    color: ic_whiteColot,
                    iconColor: ic_whiteColot,
                    prefixIcon: Icons.mail_outline,
                  ),
                  validator: (mail) {
                    if (mail == null || mail.isEmpty) {
                      return 'Enter Valid Mail';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(mail)) {
                      return "Enter Valid Mail";
                    }
                    return null;
                  },
                ),
              ),
              16.height,
              Text("Phone No.", style: secondaryTextStyle(color: ic_whiteColot)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ic_navyBlueColor,
                ),
                child: TextFormField(
                  style: TextStyle(color: ic_whiteColot),
                  controller: noController,
                  keyboardType: TextInputType.number,
                  decoration: buildInputDecoration(
                    name: "Enter No.",
                    color: ic_whiteColot,
                    prefixIcon: Icons.phone_outlined,
                    iconColor: ic_whiteColot,
                  ),
                  validator: (no) {
                    if (no == null || no.isEmpty) {
                      return 'Enter Mobile No.';
                    }
                    if (!RegExp("^[0-9]{10}").hasMatch(no)) {
                      return "Enter Valid mobile no.";
                    }
                    return null;
                  },
                ),
              ),
              16.height,
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ICMainScreen()));
                    }
                  },
                  child: Container(width: context.width(), child: Text('GetStarted', textAlign: TextAlign.center)),
                ),
              ),
              16.height,
              Text.rich(
                TextSpan(
                  text: "Dont't have an account? ",
                  style: secondaryTextStyle(color: ic_whiteColot),
                  children: <TextSpan>[
                    TextSpan(text: "Login", style: secondaryTextStyle(color: ic_skip)),
                  ],
                ),
              ).center().onTap(
                () {
                  finish(context);
                },
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
