import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/modal/FTFavouriteEventModel.dart';

class FTMyFavTabScreen extends StatefulWidget {
  @override
  _FTMyFavTabScreenState createState() => _FTMyFavTabScreenState();
}

class _FTMyFavTabScreenState extends State<FTMyFavTabScreen> {
  List<FTFavouriteEventModel> favList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    favList.add(
      FTFavouriteEventModel(
        image: 'https://i.ytimg.com/vi/lA1ItxM9yIE/maxresdefault.jpg',
        name: 'MOONLIGHT PARTY',
        address: '44 Swanson Dr.Hamden',
        date: '5:30 am - 9:00 pm',
      ),
    );
    favList.add(FTFavouriteEventModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCFJDKw_8XXk2t-AFo6CCfpdJhgMvHc_pMg&usqp=CAU',
      name: 'OCEAN BEAUTY',
      address: '44 Swanson Dr.Hamden',
      date: '5:30 am - 9:00 pm',
    ));
    favList.add(FTFavouriteEventModel(
      image: 'https://media.istockphoto.com/photos/charming-young-girl-embracing-herself-picture-id965048746?k=6&m=965048746&s=612x612&w=0&h=cxU3T2uavd0KnI1b7LlR7lKP6YlBH-RiIaLaRPDQbio=',
      name: 'CAPI SPA',
      address: '44 Swanson Dr.Hamden',
      date: '5:30 am - 9:00 pm',
    ));
    favList.add(FTFavouriteEventModel(
      image: 'https://i.pinimg.com/236x/5a/88/56/5a8856a07b07a734a500be2d42eaae41.jpg',
      name: 'BLUEBIRD SPA',
      address: '44 Swanson Dr.Hamden',
      date: '5:30 am - 9:00 pm',
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 55, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'MY FAVOURITE',
                  style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            ListView.builder(
              itemBuilder: (_, index) {
                FTFavouriteEventModel data = favList[index];

                return Dismissible(
                  key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Theme.of(context).cardColor,
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  resizeDuration: Duration(seconds: 1),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: height * 0.17,
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
                        color: Theme.of(context).cardColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.17,
                          width: width - 275,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ),
                            child: Image(
                              image: NetworkImage(data.image),
                              fit: BoxFit.cover,
                              errorBuilder: (_, obj, stack) {
                                return Container();
                              },
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              child: Text(
                                data.name,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(data.address, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(data.date, style: TextStyle(fontWeight: FontWeight.w400, wordSpacing: 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favList.length,
            ),
          ],
        ),
      ),
    );
  }
}
