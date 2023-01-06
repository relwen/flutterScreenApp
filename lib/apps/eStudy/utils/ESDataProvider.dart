import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESInboxData.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESOptionModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESConstant.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';

import 'ESColors.dart';

List<ESModel> esGetBasicData() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Design Thinking', subTitle: 'London University', image: EScat3_designing, color: ESPrimaryColor));
  list.add(ESModel(title: 'Marketing', subTitle: 'Canada University', image: EScat5_markating, color: ESSecondaryColor));
  list.add(ESModel(title: 'Art and Craft', subTitle: 'London University', image: EScat1_art, color: ESPrimaryColor));
  list.add(ESModel(title: 'Business', subTitle: 'Us University', image: EScat2_business, color: ESSecondaryColor));
  list.add(ESModel(title: 'Health', subTitle: 'NewYork University', image: EScat4_health, color: ESPrimaryColor));
  return list;
}

List<ESModel> esGetChatList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'John Wick', subTitle: 'hello', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg"));
  list.add(ESModel(title: 'Bella Hadid', subTitle: 'How ypu doing?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg"));
  list.add(ESModel(title: 'Cristin', subTitle: 'About what Course?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg"));
  list.add(ESModel(title: 'John Wick', subTitle: 'hello', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg"));
  list.add(ESModel(title: 'Bella Hadid', subTitle: 'How ypu doing?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg"));
  list.add(ESModel(title: 'Cristin', subTitle: 'About what Course?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.6.jpg"));
  list.add(ESModel(title: 'John Wick', subTitle: 'hello', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.5.jpg"));
  list.add(ESModel(title: 'Bella Hadid', subTitle: 'How ypu doing?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.7.jpg"));
  list.add(ESModel(title: 'Cristin', subTitle: 'About what Course?', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.8.jpg"));
  return list;
}

List<ESOptionModel> esOptionList() {
  List<ESOptionModel> list = [];
  list.add(ESOptionModel(icon: Icons.notification_important_outlined, title: 'Notification', color: ESSecondaryColor));
  list.add(ESOptionModel(icon: Icons.library_books_outlined, title: 'Subject', color: ESPrimaryColor));
  list.add(ESOptionModel(icon: Icons.call, title: 'Contact Adminstrator', color: ESSecondaryColor));
  list.add(ESOptionModel(icon: Icons.settings, title: 'Setting', color: ESPrimaryColor));
  list.add(ESOptionModel(icon: Icons.logout, title: 'Log Out', color: ESSecondaryColor));

  return list;
}

List<ESOptionModel> esWhatYouGetList() {
  List<ESOptionModel> list = [];
  list.add(ESOptionModel(icon: Icons.library_books_outlined, title: '25 Lesson'));
  list.add(ESOptionModel(icon: Icons.desktop_mac_sharp, title: 'Access on Mobile,Desktop & TV'));
  list.add(ESOptionModel(icon: Icons.bar_chart, title: 'Begginer Level'));
  list.add(ESOptionModel(icon: Icons.audiotrack, title: 'Audio Book'));
  list.add(ESOptionModel(icon: Icons.access_time, title: 'Lifetime Access'));
  list.add(ESOptionModel(icon: Icons.quiz, title: '100 Quiz'));
  list.add(ESOptionModel(icon: Icons.contact_page_outlined, title: 'Certificate of Completion'));

  return list;
}

List<ESInboxData> esInboxChatDataList() {
  List<ESInboxData> list = [];
  list.add(ESInboxData(id: 0, message: 'i have already taken medicine'));
  list.add(ESInboxData(id: 1, message: 'Hi Kaixa, have you taken your pills yet?'));
  list.add(ESInboxData(id: 1, message: 'sorry but i can\'t find your home number'));
  list.add(ESInboxData(id: 0, message: 'Please knock on dor'));
  list.add(ESInboxData(id: 0, message: 'I am home waiting for you'));
  list.add(ESInboxData(id: 0, message: 'Hi Miranda'));
  list.add(ESInboxData(id: 1, message: 'I am on my way to your home visit'));
  return list;
}

List<ESModel> esWalkThroughList = [
  ESModel(title: "Discover Useful Resources", subTitle: walkThroughSubtitle, image: ESWalkImage1),
  ESModel(title: "Meet With New People", subTitle: walkThroughSubtitle, image: ESWalkImage2),
  ESModel(title: "Find a New Course", subTitle: walkThroughSubtitle, image: ESWalkImage3),
];

List<ESModel> esProfessorList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Willam Son', image: ESApp_logo));
  list.add(ESModel(title: 'John Smith', image: ESApp_logo));
  return list;
}

List<ESModel> esStudentList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Aric Wick', image: ESApp_logo));
  list.add(ESModel(title: 'Justin Smith', image: ESApp_logo));
  list.add(ESModel(title: 'Bella Trailor', image: ESApp_logo));
  return list;
}

List<ESModel> esSubCategoryList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: 'Game Design (2,313)', icon: Icons.check));
  filterList.add(ESModel(title: 'Fashion (4,454)', icon: Icons.check));
  filterList.add(ESModel(title: '3D Animation (552)', icon: Icons.check));
  filterList.add(ESModel(title: 'Graphics Design (452)', icon: Icons.check));
  filterList.add(ESModel(title: 'Web Design (552)', icon: Icons.check));
  filterList.add(ESModel(title: 'User Experience (321)', icon: Icons.check));
  return filterList;
}

List<ESModel> esLevelList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: 'All Level (313)', icon: Icons.check));
  filterList.add(ESModel(title: 'Beginner (454)', icon: Icons.check));
  filterList.add(ESModel(title: 'Intermediate (600)', icon: Icons.check));
  filterList.add(ESModel(title: 'Expert (200)', icon: Icons.check));
  return filterList;
}

List<ESModel> esPriceList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: 'Paid (4,313)', icon: Icons.check));
  filterList.add(ESModel(title: 'Free (5,454)', icon: Icons.check));
  return filterList;
}

List<ESModel> esFeatureList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: 'Caption (4,313)', icon: Icons.check));
  filterList.add(ESModel(title: 'Quizzes (5,454)', icon: Icons.check));
  filterList.add(ESModel(title: 'Coding Exercises (5,454)', icon: Icons.check));
  filterList.add(ESModel(title: 'Practice tests (5,454)', icon: Icons.check));
  return filterList;
}

List<ESModel> esRatingList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: '4.5 & up (4,313)', icon: Icons.check));
  filterList.add(ESModel(title: '4.0 & up (5,454)', icon: Icons.check));
  filterList.add(ESModel(title: '3.5 & up (5,454)', icon: Icons.check));
  filterList.add(ESModel(title: '2.5 & up (5,454)', icon: Icons.check));
  return filterList;
}

List<ESModel> esVideoDurationList() {
  List<ESModel> filterList = [];
  filterList.add(ESModel(title: '0-2 hours (10,313)', icon: Icons.check));
  filterList.add(ESModel(title: '3-5 hours (6,454)', icon: Icons.check));
  filterList.add(ESModel(title: '2-7 hours (4,454)', icon: Icons.check));
  filterList.add(ESModel(title: '3-8 hours (1,454)', icon: Icons.check));
  filterList.add(ESModel(title: '17+ hours (122)', icon: Icons.check));
  return filterList;
}

List<ESModel> esSearchList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Graphic Design', subTitle: 'University Of London', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg"));
  list.add(ESModel(title: 'History of Graphic Design', subTitle: '678 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg"));
  list.add(ESModel(title: 'Digital Panting', subTitle: '678 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg"));
  list.add(ESModel(title: 'Designing thinking', subTitle: '678 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg"));
  list.add(ESModel(title: 'Logo Design', subTitle: '446 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg"));
  list.add(ESModel(title: 'App Designing ', subTitle: '3244 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.6.jpg"));
  list.add(ESModel(title: 'Sketching For Designing ', subTitle: '4545 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.5.jpg"));
  list.add(ESModel(title: 'Digital Panting', subTitle: '553 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.7.jpg"));
  list.add(ESModel(title: 'History of Graphic Design', subTitle: '4534 learner', image: "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.8.jpg"));
  return list;
}

List<ESModel> esCourseChapterList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Introduction', subTitle: '1:45', image: "01"));
  list.add(ESModel(title: 'Getting Started', subTitle: '2:00', image: "02"));
  list.add(ESModel(title: 'Layers Panel', subTitle: '1:30', image: "03"));
  list.add(ESModel(title: 'Pen Tool', subTitle: '3:00', image: "04"));
  list.add(ESModel(title: 'Get Ready to Define', subTitle: '1:35', image: "05"));
  list.add(ESModel(title: 'Ui Design', subTitle: '1:03', image: "06"));
  return list;
}

List<ESModel> editProfileList() {
  List<ESModel> list = [];
  list.add(ESModel(title: 'Username', subTitle: 'Emma Philips'));
  list.add(ESModel(title: 'Email', subTitle: 'emmaphilips@gmail.com'));
  list.add(ESModel(title: 'Phone', subTitle: '+6535656134'));
  list.add(ESModel(title: 'Gender', subTitle: 'Female'));
  list.add(ESModel(title: 'Date of birth', subTitle: '20/04/2021'));

  return list;
}
