import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

InputDecoration inputDecoration({IconData? icon, String? hintText}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: white), borderRadius: BorderRadius.circular(ecDefaultRadius1)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: white), borderRadius: BorderRadius.circular(ecDefaultRadius1)),
    filled: true,
    border: InputBorder.none,
    prefixIcon: Icon(icon, size: 20),
    hintText: hintText,
    hintStyle: secondaryTextStyle(),
  );
}

Widget commonCachedNetworkImage(String? url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/newsblog/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget buildSocialLoginButton({String? img}) {
  return Container(
    width: 50,
    height: 50,
    padding: EdgeInsets.all(8),
    decoration: boxDecorationRoundedWithShadow(8),
    child: commonCachedNetworkImage(img, fit: BoxFit.cover),
  );
}

Widget productFollowerWidget({IconData? icon, String? totalFollowerNum, String? text, Color? iconColor}) {
  return Column(
    children: [
      Icon(icon, color: iconColor, size: ecIconSize.toDouble()),
      Text(totalFollowerNum!, style: primaryTextStyle(color: white)),
      Text(text!, style: primaryTextStyle(color: white)),
    ],
  );
}

Widget reviewActionWidget({IconData? icon}) {
  return Container(
    height: 38,
    width: 38,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: gray.withOpacity(0.3)),
    child: Icon(icon, size: 20),
  );
}

Widget appButtonWidget({String? btnText, Color? color, Function()? onTap, IconData? icon}) {
  return AppButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 25, color: appStore.isDarkModeOn ? white : darkBlue),
        8.width,
        Text(btnText!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
      ],
    ),
    color: color,
    height: 50,
    onTap: onTap,
  );
}
