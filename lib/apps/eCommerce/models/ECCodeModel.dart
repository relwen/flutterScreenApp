import 'package:flutter/material.dart';

class ECCodeModel {
  String? codeTitle;
  String? couponTitle;
  String? couponId;
  String? date;
  int? codeCount;
  int? timesUsed;
  Icon? codeIcon;
  var availability;

  ECCodeModel({this.codeTitle, this.couponTitle, this.couponId, this.date, this.codeCount, this.timesUsed, this.codeIcon, this.availability});
}
