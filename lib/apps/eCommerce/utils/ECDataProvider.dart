import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCardModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCategoryModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCodeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECDropDownModels.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECNotificationModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECTimeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECTopKeySearchModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECWalkThroughModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCategoryTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECConditionScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCountryScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECDetailCouponScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECFollowingScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECInvoiceInfo.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPostReviewScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECShippingInfoScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

List<ECTimeModel> getTimeList() {
  List<ECTimeModel> timeList = [];
  timeList.add(ECTimeModel(dealTime: '08:00', dealStatus: 'Done Flash'));
  timeList.add(ECTimeModel(dealTime: '12:00', dealStatus: 'Ongoing'));
  timeList.add(ECTimeModel(dealTime: '00:28', dealStatus: 'Next Flash'));
  timeList.add(ECTimeModel(dealTime: '00:50', dealStatus: 'Next Flash'));
  return timeList;
}

List<ECTimeModel> getBrandList() {
  List<ECTimeModel> brandList = [];
  brandList.add(ECTimeModel());
  brandList.add(ECTimeModel(img: ec_nikon));
  brandList.add(ECTimeModel(img: ec_sony));
  brandList.add(ECTimeModel(img: ec_fujifilm));
  return brandList;
}

List<ECTimeModel> getBrandList1() {
  List<ECTimeModel> brandList = [];
  brandList.add(ECTimeModel(img: 'ALL'));
  brandList.add(ECTimeModel(img: 'Nikon'));
  brandList.add(ECTimeModel(img: 'SONY'));
  brandList.add(ECTimeModel(img: 'FUJIFILM'));
  return brandList;
}

List<ECProductModel> getDCList() {
  List<ECProductModel> dcList = [];
  dcList.add(ECProductModel(img: ec_canon, name: 'Canon Powershot G9 X Mark II', discount: 24, count: '4k', price: 1400));
  dcList.add(ECProductModel(img: ec_cam, name: 'Fujifilm Instax Mini 9', discount: 64, count: '4k', price: 1120));
  dcList.add(ECProductModel(img: ec_nikoncoolpix, name: 'Nikon Coolpix S6800', discount: 20, count: '2.5k', price: 1300));
  dcList.add(ECProductModel(img: ec_camera3, name: 'Sony Cybershot DSC-HX400V 20.4', discount: 40, count: '3k', price: 1400));
  return dcList;
}

List<ECProductModel> getGridImageData() {
  List<ECProductModel> collectionList = [];
  collectionList.add(ECProductModel(name: 'Food', images: [ec_food1, ec_food2, ec_food3, ec_food4]));
  collectionList.add(ECProductModel(name: 'Sport', images: [ec_sports1, ec_sports2, ec_sports3, ec_sports4]));
  collectionList.add(ECProductModel(name: 'Fashion', images: [ec_fashion1, ec_fashion2, ec_fashion3, ec_fashion4]));
  collectionList.add(ECProductModel(name: 'Address', images: [ec_address1, ec_address2, ec_address3, ec_address4]));
  collectionList.add(ECProductModel(name: 'Footwear', images: [ec_shoes1, ec_shoes2, ec_shoes3, ec_shoes4]));
  collectionList.add(ECProductModel(name: 'Traditional', images: [ec_traditional1, ec_traditional2, ec_traditional3, ec_traditional4]));
  return collectionList;
}

List<ECWalkThroughModel> getWalkThroughList() {
  List<ECWalkThroughModel> list = [];

  list.add(
    ECWalkThroughModel(
      title: 'Genuine Product',
      subTitle: 'Diversified items of products in life, genuine product, safe',
      img: 'https://img.freepik.com/free-photo/beautiful-asian-woman-carrying-colorful-bags-shopping-online-with-mobile-phone_8087-3877.jpg?size=626&ext=jpg',
    ),
  );
  list.add(
    ECWalkThroughModel(
      title: 'Convenient Ordering',
      subTitle: 'Order multiple items from multiple brands at the same time',
      img: ec_shopping2,
    ),
  );
  list.add(
    ECWalkThroughModel(
      title: 'Easy Search',
      subTitle: 'Find products easy with Scanning camera, pay with just one camera scan',
      img: ec_shopping3,
    ),
  );

  return list;
}

List<ECDropDownModelCountry> getDropDownCountryList() {
  List<ECDropDownModelCountry> countryList = [];

  countryList.add(ECDropDownModelCountry(img: commonCachedNetworkImage(ec_india, width: 50, height: 50), country: 'India'));
  countryList.add(ECDropDownModelCountry(img: commonCachedNetworkImage(ec_uk_flag, width: 50, height: 50), country: 'UK'));
  countryList.add(ECDropDownModelCountry(img: commonCachedNetworkImage(ec_usa_flag, width: 50, height: 50), country: 'USA'));

  return countryList;
}

List<ECDropDownModelCurrency> getDropDownCurrencyList() {
  List<ECDropDownModelCurrency> currencyList = [];

  currencyList.add(ECDropDownModelCurrency(currency: 'Rupee'));
  currencyList.add(ECDropDownModelCurrency(currency: 'Dollar'));
  currencyList.add(ECDropDownModelCurrency(currency: 'Dinar'));

  return currencyList;
}

List<ECDropDownModelLanguage> getDropDownLanguageList() {
  List<ECDropDownModelLanguage> languageList = [];

  languageList.add(ECDropDownModelLanguage(language: 'Sanskrit'));
  languageList.add(ECDropDownModelLanguage(language: 'Hindi'));
  languageList.add(ECDropDownModelLanguage(language: 'English'));

  return languageList;
}

List<ECProductModel> getCartDetails() {
  List<ECProductModel> cartList = [];

  cartList.add(ECProductModel(img: ec_woman1, status: 'Approved', orderId: 'Order No #678765', quantity: 3, price: 60, time: '11:20 A.M', date: '2018-03-12'));
  cartList.add(ECProductModel(img: ec_tech4, status: 'Submitted', orderId: 'Order No #678765', quantity: 3, price: 60, time: '11:20 A.M', date: '2018-03-12'));
  cartList.add(ECProductModel(img: ec_tech1, status: 'Denied', orderId: 'Order No #678765', quantity: 3, price: 60, time: '11:20 A.M', date: '2018-03-12'));
  cartList.add(ECProductModel(img: ec_woman1, status: 'Denied', orderId: 'Order No #678765', quantity: 3, price: 60, time: '11:20 A.M', date: '2018-03-12'));

  return cartList;
}

List<ECProductModel> getStoreProductDetails() {
  List<ECProductModel> storeProductList = [];

  storeProductList.add(ECProductModel(img: ec_aj1red, no: 1, name: 'Air Jordan 1 Red', rating: '4.7', count: '5.6k', sales: 700, price: 675, discount: 43));
  storeProductList.add(ECProductModel(img: ec_aj1orange, no: 2, name: 'Jordan 1 Orange', rating: '4.7', count: '5.6k', sales: 700, price: 475, discount: 43));
  // storeProductList.add(ECProductModel(img: ec_aj1blue, no: 3, name: 'Air Jordan 1 Blue', rating: '4.7', count: '5.6k', sales: 700, price: 275, discount: 59));
  return storeProductList;
}

List<ECProductModel> getFoodDetails() {
  List<ECProductModel> foodList = [];

  foodList.add(ECProductModel(img: ec_apple_cream_cake, name: 'Grapefruit apple cream cake', price: 7));
  foodList.add(ECProductModel(img: ec_cake, name: 'Mango cream cake', price: 6));
  foodList.add(ECProductModel(img: ec_cake2, name: 'Red velvet cake', price: 5));
  foodList.add(ECProductModel(img: ec_chiffon_cake, name: 'Chiffon cake', price: 8));

  return foodList;
}

List<ECProductModel> getLogoDetails() {
  List<ECProductModel> logoList = [];

  logoList.add(ECProductModel(img: ec_pizzac, name: 'Pizza Company'));
  logoList.add(ECProductModel(img: ec_pizzah, name: 'Pizza Hut'));
  logoList.add(ECProductModel(img: ec_mcd, name: 'MacDonalds'));
  logoList.add(ECProductModel(img: ec_starbucks, name: 'Starbucks'));
  logoList.add(ECProductModel(img: ec_dominos, name: 'Dominos'));
  logoList.add(ECProductModel(img: ec_burgerk, name: 'Burger King'));

  return logoList;
}

List<ECCardModel> getCardDetails() {
  List<ECCardModel> cardList = [];
  cardList.add(ECCardModel(cardNo: '**** **** **** 2345', name: 'Jonathan Erik', img: ec_card3));
  cardList.add(ECCardModel(cardNo: '**** **** **** 2320', name: 'John Smit', img: ec_card2));
  cardList.add(ECCardModel(cardNo: '**** **** **** 2389', name: 'Elizabeth', img: ec_card1));
  return cardList;
}

List<ECProductModel> getOverViewList() {
  List<ECProductModel> ovList = [];
  ovList.add(ECProductModel(
    name: 'Nike Jordan Air',
    orderId: 'SKU: 78472493',
    sales: 5,
    price: 1267,
    images: [ec_aj1orange, ec_aj1blue, ec_aj1red],
  ));

  return ovList;
}

List<ECProductModel> getMaybeInterestedList() {
  List<ECProductModel> miList = [];
  miList.add(ECProductModel(img: ec_aj1red, name: 'Sneakers 1', orderId: 'SKU: 78472493', discount: 24, price: 1267));
  miList.add(ECProductModel(img: ec_aj1orange, name: 'Sneakers 2', orderId: 'SKU: 78472493', discount: 24, price: 1267));
  miList.add(ECProductModel(img: ec_aj1blue, name: 'Sneakers 3', orderId: 'SKU: 78472493', discount: 24, price: 1267));
  return miList;
}

List<ECProductModel> getBoughtTogetherList() {
  List<ECProductModel> boughtList = [];
  boughtList.add(ECProductModel(img: ec_shoes2, price: 627));
  boughtList.add(ECProductModel(img: ec_shoes3, price: 567));
  boughtList.add(ECProductModel(img: ec_shoes7, price: 575));
  return boughtList;
}

List<ECProductModel> getProductList() {
  List<ECProductModel> pList = [];
  pList.add(ECProductModel(img: ec_aj1orange, name: 'Nike Jordan Air', rating: '4.7', count: '3k', price: 1400));
  pList.add(ECProductModel(img: ec_aj1lr, name: 'Nike Jordan Air', rating: '4.7', count: '3k', price: 1400));
  pList.add(ECProductModel(img: ec_aj1lr, name: 'Nike Jordan Air', rating: '4.7', count: '3k', price: 1400));
  pList.add(ECProductModel(img: ec_aj1lr, name: 'Nike Jordan Air', rating: '4.7', count: '3k', price: 1400));
  return pList;
}

List<ECProductModel> getTechList2() {
  List<ECProductModel> tList2 = [];
  tList2.add(ECProductModel(img: ec_canon, name: 'Canon Powershot G9 X Mark II', count: '3k', rating: '4.7', price: 1400));
  tList2.add(ECProductModel(img: ec_fujifilm, name: 'FujiFilm X-A7 Mint Green', rating: '4.7', count: '3k', price: 1400));
  return tList2;
}

List<ECCategoryModel> getCategoryList() {
  List<ECCategoryModel> categoryList = [];
  categoryList.add(ECCategoryModel(category: 'Smartphone', images: [ec_tech1, ec_tech2, ec_tech3]));
  categoryList.add(ECCategoryModel(category: 'Smart TV', images: [ec_tech1, ec_tech2, ec_tech3]));
  categoryList.add(ECCategoryModel(category: 'Laptop', images: [ec_tech1, ec_tech2, ec_tech3]));
  categoryList.add(ECCategoryModel(category: 'Tablet', images: [ec_tech1, ec_tech2, ec_tech3]));
  categoryList.add(ECCategoryModel(category: 'Headphone', images: [ec_tech1, ec_tech2, ec_tech3]));
  categoryList.add(ECCategoryModel(category: 'Camera', images: [ec_tech1, ec_tech2, ec_tech3]));
  return categoryList;
}

List<ECProductModel> getFollowDetails() {
  List<ECProductModel> followList = [];

  followList.add(ECProductModel(img: ec_girlface, name: 'Brooklyn Shop', count: '4k'));
  followList.add(ECProductModel(img: ec_girlface, name: 'Ralph Restaurant', count: '4k'));
  followList.add(ECProductModel(img: ec_girlface, name: 'Miles Shoe', count: '4k'));
  followList.add(ECProductModel(img: ec_girlface, name: 'Theresa Store', count: '4k'));
  followList.add(ECProductModel(img: ec_girlface, name: 'Theresa Store', count: '4k'));
  followList.add(ECProductModel(img: ec_girlface, name: 'Theresa Store', count: '4k'));
  return followList;
}

List<ECCategoryModel> getGeneralDetails() {
  List<ECCategoryModel> generalList = [];
  generalList.add(
    ECCategoryModel(
      img1: ec_man4,
      count: '1.2k',
      cName: 'Men',
      images: [ec_man1, ec_man2, ec_man3],
      backGroundColor: turquoise,
    ),
  );
  generalList.add(
    ECCategoryModel(
      img1: ec_woman4,
      count: '1.2k',
      cName: 'Women',
      images: [ec_woman1, ec_woman2, ec_woman3],
      backGroundColor: lightSkyBlue.withOpacity(0.4),
    ),
  );
  generalList.add(
    ECCategoryModel(
      img1: ec_tech4,
      count: '1.7k',
      cName: 'Technology',
      images: [ec_tech1, ec_tech2, ec_tech3],
      backGroundColor: salmon.withOpacity(0.2),
    ),
  );
  return generalList;
}

List<ECCodeModel> getCodeData() {
  List<ECCodeModel> codeList = [];
  codeList.add(ECCodeModel(codeTitle: 'Discount Code', couponTitle: 'Personal 10% with IDDQD15', couponId: 'DR3846', codeCount: 01, date: 'May  \n08', timesUsed: 84));
  codeList.add(ECCodeModel(codeTitle: 'Shipping Code', couponTitle: '50% off on mens wear "supersale offer"', couponId: 'DR3846', codeCount: 01, date: 'May \n08', timesUsed: 84));
  codeList.add(ECCodeModel(codeTitle: 'Shipping Code', couponTitle: '50% off on mens wear "supersale offer"', couponId: 'DR3846', codeCount: 01, date: 'May \n08', timesUsed: 84));
  return codeList;
}

List<ECCodeModel> getCouponData() {
  List<ECCodeModel> couponList = [];
  couponList.add(
    ECCodeModel(codeIcon: Icon(FontAwesome.cube, color: white, size: 20), availability: 24, codeTitle: 'Smartphone', couponTitle: 'Online Technology Store'),
  );
  couponList.add(
    ECCodeModel(codeIcon: Icon(MaterialCommunityIcons.cart_outline, color: white, size: 20), availability: 24, codeTitle: '10%', couponTitle: 'Invoice more 1 minion'),
  );
  couponList.add(ECCodeModel(codeIcon: Icon(Feather.shopping_bag, color: white, size: 20), availability: 24, codeTitle: 'Smartphone', couponTitle: 'Online Technology Store'));
  couponList.add(
    ECCodeModel(codeIcon: Icon(Feather.truck, color: white, size: 20), availability: 24, codeTitle: '3 Product', couponTitle: 'Online Technology Store'),
  );
  couponList.add(
    ECCodeModel(codeIcon: Icon(Ionicons.call_outline, color: white, size: 20), availability: 24, codeTitle: 'COD', couponTitle: 'Free ship under 3km'),
  );
  couponList.add(
    ECCodeModel(codeIcon: Icon(Feather.truck, color: white, size: 20), availability: 24, codeTitle: '65 for Product', couponTitle: 'Flash Sale only 6\$'),
  );
  return couponList;
}

List<ECCardModel> getCardData() {
  List<ECCardModel> cardList = [];
  cardList.add(ECCardModel(img: ec_event, name: 'Event', col: Colors.indigo[500], bgCol: Colors.indigo[100]));
  cardList.add(ECCardModel(img: ec_trasport, name: 'Transport', col: Colors.lightBlue[500], bgCol: Colors.lightBlue[100]));
  cardList.add(ECCardModel(img: ec_live, name: 'Live', col: Colors.pink[500], bgCol: Colors.pink[100]));
  cardList.add(ECCardModel(img: ec_coin, name: 'Coin', col: Colors.green[500], bgCol: Colors.green[100]));
  cardList.add(ECCardModel(img: ec_sale, name: 'Flash Sale', col: Colors.red[500], bgCol: Colors.red[100]));
  cardList.add(ECCardModel(img: ec_search, name: 'Search', col: Colors.yellow[500], bgCol: Colors.yellow[100]));
  cardList.add(ECCardModel(img: ec_premium, name: 'Premium', col: Colors.orange[500], bgCol: Colors.orange[100]));
  cardList.add(ECCardModel(img: ec_card5, name: 'Card', col: Colors.purple[500], bgCol: Colors.purple[100]));
  return cardList;
}

List<ECCodeModel> getHistoryData() {
  List<ECCodeModel> historyList = [];
  historyList
      .add(ECCodeModel(codeTitle: '+1000', couponTitle: 'Accepted- September 23,2022', availability: 'The challenge of scratching is winning: Give you 1000 coin Discount on payment while buying'));
  historyList.add(
      ECCodeModel(codeTitle: '+100', couponTitle: 'Cancelled- September 23,2022', availability: 'You get a refund to your My Coin account (+100 Coin) when making a purchase. Order number: 893957'));
  historyList.add(
      ECCodeModel(codeTitle: '-100', couponTitle: 'Cancelled- September 23,2022', availability: 'You get a refund to your My Coin account (+100 Coin) when making a purchase. Order number: 893957'));

  return historyList;
}

List<ECNotificationModel> getNotificationData() {
  List<ECNotificationModel> notificationList = [];
  notificationList.add(
    ECNotificationModel(
        icon: Icon(MaterialCommunityIcons.gift, size: ecIconSize.toDouble(), color: appStore.isDarkModeOn ? white : darkBlue),
        notificationTitle: 'Order Arrived',
        notificationSubTitle: 'Order 24089794727000824 has been completed & arrived at the destination address (Please rate your order)',
        notificationDate: 'July 20,2020 (08:00 pm)'),
  );
  notificationList.add(
    ECNotificationModel(
        icon: Icon(MaterialCommunityIcons.image, size: ecIconSize.toDouble(), color: appStore.isDarkModeOn ? white : darkBlue),
        notificationTitle: 'Order Arrived',
        notificationSubTitle: 'Order 24089794727000824 has been completed & arrived at the destination address (Please rate your order)',
        notificationDate: 'July 20,2020 (08:00 pm)'),
  );
  notificationList.add(
    ECNotificationModel(
        icon: Icon(Feather.shopping_bag, size: ecIconSize.toDouble(), color: appStore.isDarkModeOn ? white : darkBlue),
        notificationTitle: 'Order Arrived',
        notificationSubTitle: 'Order 24089794727000824 has been completed & arrived at the destination address (Please rate your order)',
        notificationDate: 'July 20,2020 (08:00 pm)'),
  );
  notificationList.add(
    ECNotificationModel(
        icon: Icon(Icons.star_rounded, size: ecIconSize.toDouble(), color: appStore.isDarkModeOn ? white : darkBlue),
        notificationTitle: 'Order Arrived',
        notificationSubTitle: 'Order 24089794727000824 has been completed & arrived at the destination address (Please rate your order)',
        notificationDate: 'July 20,2020 (08:00 pm)'),
  );

  return notificationList;
}

List<ECTopKeySearchModel> getTopSearchList() {
  List<ECTopKeySearchModel> topSearchList = [];
  topSearchList.add(ECTopKeySearchModel(img: ec_man, name: 'Man', totalProduct: '(25k product)', icon: Icon(Icons.call_made, size: ecIconSize.toDouble())));
  topSearchList.add(ECTopKeySearchModel(img: ec_women5, name: 'Women', totalProduct: '(35k product)', icon: Icon(Icons.call_made, size: ecIconSize.toDouble())));
  topSearchList.add(ECTopKeySearchModel(img: ec_woman2, name: 'Jeans', totalProduct: '(45k product)', icon: Icon(Icons.call_made, size: ecIconSize.toDouble())));
  return topSearchList;
}

List<ECCardModel> getSettingList1() {
  List<ECCardModel> list = [];
  list.add(ECCardModel(icon: AntDesign.earth, name: 'Social Network Connection', widget: ECFollowingScreen()));
  list.add(ECCardModel(icon: AntDesign.tago, name: 'Promotion Code', widget: ECDetailCouponScreen()));
  list.add(ECCardModel(icon: Octicons.list_unordered, name: 'Order Management', widget: ECShippingInfoScreen()));
  list.add(ECCardModel(icon: MaterialCommunityIcons.widgets, name: 'Your Widget', widget: ECCountryScreen()));
  return list;
}

List<ECCardModel> getSettingList2() {
  List<ECCardModel> list = [];
  list.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Recently viewed products', widget: ECCartTabBarPage()));
  list.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Reviews of purchased products', widget: ECPostReviewScreen()));
  list.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Favourites', widget: ECCategoryTabBarPage()));
  list.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Billing Information', widget: ECInvoiceInfo()));
  list.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Support', widget: ECConditionScreen()));
  return list;
}

List<ECNotificationModel> getMonthMissionData() {
  List<ECNotificationModel> monthMissionList = [];
  monthMissionList.add(ECNotificationModel(icon: Icon(Ionicons.map, size: 70, color: Colors.indigo), notificationTitle: 'New Puzzles', notificationSubTitle: '60% done'));
  monthMissionList.add(ECNotificationModel(icon: Icon(FontAwesome.file_text, size: 70, color: Colors.indigo), notificationTitle: 'Memories', notificationSubTitle: '80% done'));

  return monthMissionList;
}

List<ECCardModel> getContactSocialList() {
  List<ECCardModel> contactSocialList = [];
  contactSocialList.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Contact with Facebook'));
  contactSocialList.add(ECCardModel(icon: Icons.keyboard_arrow_right, name: 'Contact with PhoneBook'));

  return contactSocialList;
}

List<ECNotificationModel> getCoinGoldData() {
  List<ECNotificationModel> coinGoldList = [];
  coinGoldList.add(
    ECNotificationModel(
      icon: Icon(Icons.shopping_bag, color: ec_seaBlue, size: 20),
      notificationTitle: '1000',
      notificationSubTitle: 'Coins',
    ),
  );
  coinGoldList.add(
    ECNotificationModel(
      icon: Icon(Icons.shopping_bag, color: lightYellow, size: 20),
      notificationTitle: 'Gold',
      notificationSubTitle: 'Loyalty Program',
    ),
  );

  return coinGoldList;
}

List<ECNotificationModel> getInformationData() {
  List<ECNotificationModel> informationList = [];
  informationList.add(
    ECNotificationModel(
      icon: Icon(Icons.calendar_today, color: grey),
      notificationTitle: 'Membership form five',
      notificationSubTitle: '2022',
    ),
  );
  informationList.add(
    ECNotificationModel(
      icon: Icon(FontAwesome.cube, color: grey),
      notificationTitle: 'Product',
      notificationSubTitle: '2390+ product on sale',
    ),
  );
  informationList.add(
    ECNotificationModel(
      icon: Icon(AntDesign.edit, color: grey),
      notificationTitle: 'Description of the store',
      notificationSubTitle: 'Description of the storeDescription of the store',
    ),
  );
  informationList.add(
    ECNotificationModel(
      icon: Icon(Icons.people, color: grey),
      notificationTitle: 'Followers',
      notificationSubTitle: '239k Followers',
    ),
  );

  return informationList;
}
