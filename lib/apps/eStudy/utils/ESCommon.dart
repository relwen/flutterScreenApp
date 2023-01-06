import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import 'ESColors.dart';
import 'ESImages.dart';

InputDecoration inputDecoration(BuildContext context, {String? hint, Widget? prefixIcon}) {
  return InputDecoration(
    labelStyle: TextStyle(color: Theme.of(context).textTheme.headline6!.color),
    contentPadding: EdgeInsets.all(8),
    hintText: hint,
    hintStyle: secondaryTextStyle(),
    prefixIcon: prefixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(defaultRadius),
      borderSide: BorderSide(color: viewLineColor, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(defaultRadius),
      borderSide: BorderSide(color: primaryColor, width: 1.0),
    ),
  );
}

Widget searchTextField({BuildContext? context, Function? onTap}) {
  return Container(
    decoration: boxDecorationWithShadow(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : white,
      borderRadius: radius(8),
    ),
    child: AppTextField(
      // controller: searchController,
      textFieldType: TextFieldType.OTHER,
      textStyle: secondaryTextStyle(color: black),
      autoFocus: false,
      readOnly: true,
      onTap: () {
        onTap!();
      },
      decoration: InputDecoration(
        fillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : white,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: 'Search here',
        hintStyle: secondaryTextStyle(),
        prefixIcon: Icon(Icons.search, color: ESSecondaryColor),
      ),
    ).cornerRadiusWithClipRRect(8).paddingOnly(left: 16, right: 16),
  );
}

Widget dashboardLabelsAndSeeAll({String? label, Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label!, style: primaryTextStyle(size: 18)),
      TextButton(
        onPressed: onTap!,
        child: Row(
          children: [
            Text('See All', style: primaryTextStyle(color: ESSecondaryColor)),
            Icon(Icons.chevron_right, color: ESSecondaryColor, size: 20),
          ],
        ),
      )
    ],
  );
}

Widget dashboardLabelsAndWASeeAll(String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: primaryTextStyle(size: 18)),
      Icon(Icons.chevron_right, color: ESSecondaryColor, size: 20),
    ],
  );
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset(ESApp_logo, height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget cachedImage(String url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment!, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment!, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

InputDecoration ESinputDecoration(BuildContext context, {String? hint, Widget? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: appStore.isDarkModeOn ? whiteColor : ESPrimaryColor,
          )),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: viewLineColor)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: viewLineColor)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: viewLineColor)),
      labelText: hint,
      hintStyle: secondaryTextStyle(size: 16),
      labelStyle: secondaryTextStyle(),
      contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon);
}

commonSocialButton({BuildContext? context, IconData? icon, String? name, Color? color}) {
  return Container(
    alignment: Alignment.center,
    width: context!.width() * 0.42,
    padding: EdgeInsets.all(8),
    decoration: boxDecorationWithRoundedCorners(border: Border.all(color: color!), backgroundColor: context.cardColor),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon!, color: color),
        8.width,
        Text(name!, style: primaryTextStyle(size: 18, color: color)),
      ],
    ),
  );
}
