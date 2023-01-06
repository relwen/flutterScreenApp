import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

class FTActiveIconWidget extends StatelessWidget {
  final String title;
  final Widget icon;




  FTActiveIconWidget({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn ?iconColorSecondary:Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          icon,
          Text(title, style: TextStyle(fontSize: 12,color: Colors.white)),
        ],
      ),
    );
  }
}
