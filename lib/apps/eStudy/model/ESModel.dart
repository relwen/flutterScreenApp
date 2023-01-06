import 'package:flutter/material.dart';

class ESModel {
  String? title;
  String? subTitle;
  String? image;
  IconData? icon;
  bool? isCheckList;
  Color? color;

  ESModel({this.title, this.subTitle, this.image, this.color, this.isCheckList = false, this.icon});
}
