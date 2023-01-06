import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

Widget commonCacheImageWidget(String? url, double? height, {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit);
  }
}

Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/eStudy/ic_placeholder.jpg', fit: BoxFit.cover);

Widget courseWidget({IconData? icon, String? courseName, Color? iconColor}) {
  return Row(
    children: [
      Icon(icon, color: iconColor, size: 16),
      8.width,
      Text(courseName!, style: secondaryTextStyle()),
    ],
  );
}

Widget checkPaymentData({String? name, String? img}) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(8)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        commonCacheImageWidget(img!, 20, width: 20, fit: BoxFit.cover),
        8.width,
        Text(name!, style: primaryTextStyle()),
      ],
    ),
  );
}

Widget esMastercardWidget({double? width, String? cardNumber, String? holderName, String? validDate}) {
  return Container(
    width: width,
    color: appPrimaryColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Text('MASTERCARD', style: primaryTextStyle(color: Colors.white, size: 18)),
        16.height,
        Image.network(
          'https://image.shutterstock.com/image-vector/plastic-card-chip-electronic-device-260nw-777888688.jpg',
          height: 50,
          fit: BoxFit.cover,
        ).cornerRadiusWithClipRRect(10),
        16.height,
        Text(cardNumber!, style: primaryTextStyle(color: Colors.white, size: 18)),
        18.height,
        Row(
          children: [
            Text(holderName!, style: primaryTextStyle(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis).expand(flex: 2),
            Column(
              children: [
                Text('Valid TO', style: primaryTextStyle(color: Colors.white, size: 12)),
                Text(validDate!, style: primaryTextStyle(color: Colors.white, size: 14)),
              ],
            ).expand(flex: 1),
            Image.asset('images/eStudy/ic_master_logo.png', height: 50, fit: BoxFit.contain).paddingRight(8)
          ],
        )
      ],
    ).paddingLeft(16),
  ).cornerRadiusWithClipRRect(15);
}
