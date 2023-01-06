import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/main.dart';

class FtCommanListWidget extends StatelessWidget {
  final List? list;
  final String title;


  const FtCommanListWidget({Key? key, this.list,required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.play(
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(fontSize: 18, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
        ),
        backgroundColor:Theme.of(context).cardColor ,
      ),
      body: ListView.builder(
          itemCount: list!.length,
          itemBuilder: (_, int index) {
            return InkWell(
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
                  color: appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.white,
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
                          image: NetworkImage(list![index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          child: Text(list![index].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 1.5)),
                          padding: const EdgeInsets.only(left: 15, top: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(list![index].address, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(list![index].date, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1.5)),
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
    );
  }
}
