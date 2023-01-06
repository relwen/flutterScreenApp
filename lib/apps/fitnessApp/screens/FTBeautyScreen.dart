import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/modal/FTBeautyEventModel.dart';
import 'package:mighty_ui_kit/main.dart';


class FTBeautyScreen extends StatefulWidget {
  @override
  _FTBeautyScreenState createState() => _FTBeautyScreenState();
}

class _FTBeautyScreenState extends State<FTBeautyScreen> {
  bool _isShowDial = false;
  List<FTBeautyEventModel> bList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bList.add(FTBeautyEventModel(
      image: 'https://i.pinimg.com/236x/b3/c3/16/b3c31620714b120fff3908bbd00e4111.jpg',
      name: 'OCEAN BEAUTY',
      address: '44 Swanson Dr.Hamden',
      date: '5:30 am - 9:00 pm',
    ));
    bList.add(FTBeautyEventModel(
      image: 'https://i.pinimg.com/originals/ab/39/3e/ab393e59e00c755940034913d452f096.jpg',
      name: 'MSMOF SPA',
      address: '44 Swanson Dr.Hamden',
      date: '5:30 am - 9:00 pm',
    ));
    bList.add(
      FTBeautyEventModel(
        image: 'https://i.pinimg.com/originals/c0/8e/a1/c08ea199ab270e631b90f02ba75a289f.jpg',
        name: 'BEAUTY PLUS SPA  ',
        address: '44 Swanson Dr.Hamden',
        date: '5:30 am - 9:00 pm',
      ),
    );
    bList.add(
      FTBeautyEventModel(
        image: 'https://i.pinimg.com/236x/65/49/10/654910ad0016f0f3cb01285f92221d18.jpg',
        name: 'CAPI SPA',
        address: '44 Swanson Dr.Hamden',
        date: '5:30 am - 9:00 pm',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: Padding(
          padding: EdgeInsets.only(top: 15),
          child: BackButton(
            color: Theme.of(context).iconTheme.color,

          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            'BEAUTY',
            style: GoogleFonts.play(
              fontWeight: FontWeight.bold,
              textStyle: TextStyle( fontSize: 18,color: appStore.isDarkModeOn ?Colors.white :Colors.black),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.transparent,
      ),
      floatingActionButton: _getFloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 83),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 50,
                    width: width - 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 15),
                      child: TextField(
                        style: TextStyle(color: appStore.isDarkModeOn ?Colors.black:Colors.black),
                        // controller: textEditingController,

                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search Something',
                          hintStyle: TextStyle(color:Colors.black),
                          suffixIcon: Icon(
                            Icons.search_rounded,

                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 20),
              ListView.builder(
                  itemCount: bList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    FTBeautyEventModel data = bList[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 8, right: 20),
                        height: height * 0.2,
                        width: width - 34,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                          color: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height * 0.2,
                              width: width * 0.38,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                                child: Image(
                                  image: NetworkImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  child: Text(data.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 1.5)),
                                  padding: const EdgeInsets.only(left: 15, top: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 10),
                                  child: Text(data.address, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 10),
                                  child: Text(data.date, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text('4.8', style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        this._isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          backgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red,
          mini: false,
          child: Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.work_outline),
          onPressed: () {
            //if need to close menu after click
            _isShowDial = false;
            setState(() {});
          },
          backgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.access_alarm),
          onPressed: () {
            //if need to toggle menu after click
            _isShowDial = !_isShowDial;
            setState(() {});
          },
          backgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.person_rounded),
          onPressed: () {
            //if no need to change the menu status
          },
          backgroundColor: appStore.isDarkModeOn ?Theme.of(context).cardColor:Colors.red
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }
}
