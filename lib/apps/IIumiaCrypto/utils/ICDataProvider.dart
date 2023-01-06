import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICActivityList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICAddCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICBalanceList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICCurrenciesList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDashBoardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDetailCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICMenuList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICMyWalletList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICNetworkList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICNewsList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICRecentTransactions.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICReportList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICRevenueList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICSettingsList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICTradingList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICTransactionHistoryList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICWatchList1.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICBalanceScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICDefaultCurrenciesScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICManagerScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICNetworkScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICReportScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICTouchIdScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICTradingScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

List<ICActivityList> getActivityList() {
  List<ICActivityList> list = [];

  list.add(ICActivityList(
      i: 'images/iiumiaCrypto/ic_bitcoin.png',
      head: 'Bitcoin',
      pFig: '128.76 ',
      subStr: 'BTC',
      secFig: '+18.88(18%)',
      secColor: ic_skip,
      data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
      colors: [Colors.blue[700], Colors.transparent],
      lineColor: Colors.blue));
  list.add(ICActivityList(
      i: 'images/iiumiaCrypto/ic_dash.png',
      head: 'Dash',
      pFig: '128.76 ',
      subStr: 'DAS',
      secFig: '-18.88(18%)',
      secColor: Colors.red,
      data: [0.0, -0.5, -1.0, -0.5, 0.0, 0.0, 0.0, 1.0, 1.5, 2.0, 0.0],
      colors: [Colors.red[700], Colors.transparent],
      lineColor: Colors.red));
  list.add(ICActivityList(
      i: 'images/iiumiaCrypto/ic_bitcoin.png',
      head: 'Bitcoin',
      pFig: '128.76 ',
      subStr: 'BTC',
      secFig: '-18.88(18%)',
      secColor: Colors.red,
      data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
      colors: [Colors.deepPurple[700], Colors.transparent],
      lineColor: Colors.deepPurple));
  list.add(ICActivityList(
      i: 'images/iiumiaCrypto/ic_bitcoin.png',
      head: 'Bitcoin',
      pFig: '128.76 ',
      subStr: 'BTC',
      secFig: '+18.88(18%)',
      secColor: ic_skip,
      data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
      colors: [Colors.blue[700], Colors.transparent],
      lineColor: Colors.blue));
  list.add(ICActivityList(
      i: 'images/iiumiaCrypto/ic_bitcoin.png',
      head: 'Bitcoin',
      pFig: '128.76 ',
      subStr: 'BTC',
      secFig: '-18.88(18%)',
      secColor: Colors.red,
      data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
      colors: [Colors.red[700], Colors.transparent],
      lineColor: Colors.red));

  return list;
}

List<ICRecentTransactions> getRecentTransactionsList() {
  List<ICRecentTransactions> list = [];

  list.add(ICRecentTransactions(
      i: Icon(
        Icons.arrow_downward_outlined,
        color: Colors.blue,
      ),
      ptext: 'Lapak lapak',
      subtext: "Received - 1 Jan 2020",
      fig: "+1.33BTC"));
  list.add(ICRecentTransactions(
      i: Icon(
        Icons.arrow_downward_outlined,
        color: Colors.blue,
      ),
      ptext: 'Lapak lapak',
      subtext: "Received - 1 Jan 2020",
      fig: "+1.33BTC"));
  list.add(ICRecentTransactions(
      i: Icon(
        Icons.arrow_downward_outlined,
        color: Colors.blue,
      ),
      ptext: 'Lapak lapak',
      subtext: "Received - 1 Jan 2020",
      fig: "+1.33BTC"));
  list.add(ICRecentTransactions(
      i: Icon(
        Icons.arrow_downward_outlined,
        color: Colors.blue,
      ),
      ptext: 'Lapak lapak',
      subtext: "Received - 1 Jan 2020",
      fig: "+1.33BTC"));

  return list;
}

List<ICDashBoardList> getDashBoradList() {
  List<ICDashBoardList> list = [];

  list.add(
    ICDashBoardList(i: Icon(Icons.wb_sunny_outlined, color: Colors.deepOrangeAccent), head: "Manager", screen: ICManagerScreen()),
  );
  list.add(
    ICDashBoardList(i: Icon(Icons.compare_arrows_sharp, color: Colors.yellow), head: "Balance", screen: ICBalanceScreen()),
  );
  list.add(ICDashBoardList(i: Icon(Icons.paste_outlined, color: ic_skip), head: "Report", screen: ICReportScreen()));
  list.add(
    ICDashBoardList(i: Icon(Icons.analytics_outlined, color: Colors.purpleAccent), head: "History", screen: ICHistoryScreen()),
  );
  list.add(
    ICDashBoardList(i: Icon(Icons.bar_chart_outlined, color: Colors.green), head: "Trading", screen: ICTradingScreen()),
  );

  return list;
}

List<ICRevenueList1> getRevenueList1() {
  List<ICRevenueList1> list = [];

  list.add(ICRevenueList1(c: Colors.purple, h1: "\$ 1467.56", h2: "sent"));
  list.add(ICRevenueList1(c: Colors.blue, h1: "\$ 1467.56", h2: "received"));
  list.add(ICRevenueList1(c: Colors.red, h1: "\$ 1467.56", h2: "other"));

  return list;
}

List<ICRevenueList2> getRevenueList2() {
  List<ICRevenueList2> list = [];

  list.add(ICRevenueList2(i: "images/iiumiaCrypto/ic_bitcoin.png", ic: Icon(Icons.trending_down, color: Colors.red), c: Colors.red));
  list.add(ICRevenueList2(i: "images/iiumiaCrypto/ic_eth.png", ic: Icon(Icons.trending_up, color: Colors.blue), c: ic_skip));
  list.add(ICRevenueList2(i: "images/iiumiaCrypto/ic_dash.png", ic: Icon(Icons.trending_up, color: Colors.blue), c: ic_skip));
  list.add(ICRevenueList2(i: "images/iiumiaCrypto/ic_bitcoin.png", ic: Icon(Icons.trending_up, color: Colors.blue), c: ic_skip));
  list.add(ICRevenueList2(i: "images/iiumiaCrypto/ic_bitcoin.png", ic: Icon(Icons.trending_up, color: Colors.blue), c: ic_skip));

  return list;
}

List<ICBalanceList> getBalanceList() {
  List<ICBalanceList> list = [];

  list.add(ICBalanceList(img: "images/iiumiaCrypto/ic_bitcoin.png", head: "Bitcoin", sec: "0.30462 BTC", fig: "-0.0034"));
  list.add(ICBalanceList(img: "images/iiumiaCrypto/ic_eth.png", head: "Ethereum", sec: "6.03841 ETH", fig: "-\$356 (13%)"));
  list.add(ICBalanceList(img: "images/iiumiaCrypto/ic_bitcoin.png", head: "Bitcoin", sec: "0.30462 BTC", fig: "-0.0034"));

  return list;
}

List<ICTransactionHistoryList> getTransactionHistoryList() {
  List<ICTransactionHistoryList> list = [];

  list.add(ICTransactionHistoryList(img: "images/iiumiaCrypto/ic_waveCoin.png", head: "Wave coin", secStr: "26/07/2019", fig: "+0.001 BTC", c: ic_skip));
  list.add(ICTransactionHistoryList(img: "images/iiumiaCrypto/ic_eth.png", head: "Nov 30 2017", secStr: "26/07/2019", fig: "-0.30455 BTC", c: Colors.red));
  list.add(ICTransactionHistoryList(img: "images/iiumiaCrypto/ic_bitcoin.png", head: "Bitcoin", secStr: "26/07/2019", fig: "+0.001 BTC", c: ic_skip));

  return list;
}

List<ICTransactionHistoryList> getTransactionHistoryList2() {
  List<ICTransactionHistoryList> list = [];

  list.add(ICTransactionHistoryList(img: "images/iiumiaCrypto/ic_waveCoin.png", head: "Wave coin", secStr: "26/07/2019", fig: "+0.001 BTC", c: ic_skip));
  list.add(ICTransactionHistoryList(img: "images/iiumiaCrypto/ic_bitcoin.png", head: "Bitcoin", secStr: "26/07/2019", fig: "+0.001 BTC", c: ic_skip));

  return list;
}

List<ICReportList> getReportList() {
  List<ICReportList> list = [];

  list.add(ICReportList(pText: "Market Cap", secText: "Overall", pFig: '\$113,310,050,984 USD', secFig: '17,327,325 BTC'));
  list.add(ICReportList(pText: "Volume", secText: "24h", pFig: '\$4,177,603,866 USD', secFig: '638,400 BTC'));
  list.add(ICReportList(pText: "Circulating", secText: "Supply", pFig: '17,327,325 BTC', secFig: ''));
  list.add(ICReportList(pText: "Max", secText: "Supply", pFig: '21,000,000 BTC', secFig: ''));

  return list;
}

List<ICTradingList> getTradingList() {
  List<ICTradingList> list = [];

  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_eth.png', pText: 'Ethereum', secText: '0.30462 ETH'));
  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_bitcoin.png', pText: 'Bitcoin', secText: '0.30462 BTC'));
  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_waveCoin.png', pText: 'Waves coin', secText: '0.30462 WAC'));
  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_eth.png', pText: 'Moreno', secText: '0.30462 MOR'));
  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_ripple.png', pText: 'Ripple', secText: '0.30462 RIP'));
  list.add(ICTradingList(img: 'images/iiumiaCrypto/ic_eth.png', pText: 'Ethereum', secText: '0.30462 ETH'));

  return list;
}

List<ICWatchList1> getWatchList1() {
  List<ICWatchList1> list = [];

  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_eth.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_down, color: Colors.red), fig: '0.46%', c: Colors.red));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_bitcoin.png', pText: 'Nov 30 2017', secText: '\$4,345.90', i: Icon(Icons.trending_up, color: Colors.blue), fig: '+0.001 BTC', c: Colors.blue));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_ripple.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_down, color: Colors.red), fig: '0.46%', c: Colors.red));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_dash.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_up, color: Colors.blue), fig: '0.46%', c: Colors.blue));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_eth.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_down, color: Colors.red), fig: '0.46%', c: Colors.red));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_bitcoin.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_up, color: Colors.blue), fig: '0.46%', c: Colors.blue));
  list.add(ICWatchList1(img: 'images/iiumiaCrypto/ic_ripple.png', pText: 'Bitcoin', secText: '\$4,345.90', i: Icon(Icons.trending_down, color: Colors.red), fig: '0.46%', c: Colors.red));

  return list;
}

List<ICNewsList> getNewsList() {
  List<ICNewsList> list = [];

  list.add(ICNewsList(
      img: 'images/iiumiaCrypto/ic_download.png',
      pText: 'Algorithmic Trading Platform Quantconnect Extends Reach',
      secText: 'Dec 14 2017 2:30 PM',
      thirdText: 'By Seri',
      forthText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry'));
  list.add(ICNewsList(
      img: 'images/iiumiaCrypto/ic_download2.jpg',
      pText: 'Cyber Crime Unit to Catch Sexual Predators By Mining Bitcoin',
      secText: 'Dec 14 2017 2:30 PM',
      thirdText: 'coindesc.com',
      forthText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry'));
  list.add(ICNewsList(
      img: 'images/iiumiaCrypto/ic_download.png',
      pText: 'UK Police Force Investigate the Default Mintpal Exchange and Owner',
      secText: 'Dec 14 2017 2:30 PM',
      thirdText: 'By Seri',
      forthText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry'));

  return list;
}

List<ICMenuList> getMenuList() {
  List<ICMenuList> list = [];

  list.add(ICMenuList(
      i: Icon(
        Icons.broken_image_outlined,
        color: Colors.amber,
      ),
      head: 'Statics'));
  list.add(ICMenuList(
      i: Icon(
        Icons.multitrack_audio_outlined,
        color: Colors.greenAccent,
      ),
      head: 'Trade'));
  list.add(ICMenuList(
      i: Icon(
        Icons.person_outline,
        color: Colors.green,
      ),
      head: 'Info'));
  list.add(ICMenuList(
      i: Icon(
        Icons.notifications_none,
        color: Colors.lightBlueAccent,
      ),
      head: 'Notification'));
  list.add(ICMenuList(
      i: Icon(
        Icons.compare_arrows_outlined,
        color: Colors.pink,
      ),
      head: 'Transfer'));
  list.add(ICMenuList(
      i: Icon(
        Icons.folder_open_rounded,
        color: Colors.deepOrange,
      ),
      head: 'Crypto Wallet'));
  list.add(ICMenuList(
      i: Icon(
        Icons.bookmark_border,
        color: Colors.green,
      ),
      head: 'Coupon'));
  list.add(ICMenuList(
      i: Icon(
        Icons.messenger_outline_outlined,
        color: Colors.blue,
      ),
      head: 'Messanger'));
  list.add(ICMenuList(
      i: Icon(
        Icons.menu_book_sharp,
        color: Colors.red,
      ),
      head: 'Wallet'));

  return list;
}

List<SendList> getSendList() {
  List<SendList> list = [];

  list.add(SendList(img: 'images/iiumiaCrypto/ic_profile.png', name: 'Avling'));
  list.add(SendList(img: 'images/iiumiaCrypto/ic_profile2.png', name: 'Avling'));
  list.add(SendList(img: 'images/iiumiaCrypto/ic_profile.png', name: 'Avling'));

  return list;
}

List<ICDetCardMenuList> getDetCardMenuList() {
  List<ICDetCardMenuList> list = [];

  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.dashboard_outlined,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Dashboard'));
  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.lightbulb_outline,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Set Lights'));
  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.book_outlined,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Block Card'));
  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.compare_arrows,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Transfer'));
  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.archive_outlined,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Withdraw'));
  list.add(ICDetCardMenuList(
      i: Icon(
        Icons.money_sharp,
        color: ic_whiteColot,
        size: 30,
      ),
      head: 'Load Funds'));

  return list;
}

List<DetailCardTranList> getDetailCardTranList() {
  List<DetailCardTranList> list = [];

  list.add(DetailCardTranList(
    img: 'images/iiumiaCrypto/ic_profile.png',
    pText: 'Mc Donalds',
    secText: '26.07.2019',
    fig: '-0.0034',
  ));
  list.add(DetailCardTranList(
    img: 'images/iiumiaCrypto/ic_profile2.png',
    pText: 'Mc Donalds',
    secText: '26.07.2019',
    fig: '-0.0034',
  ));

  return list;
}

List<ICAddCardList> getAddCardList() {
  List<ICAddCardList> list = [];

  list.add(ICAddCardList(
      img: Container(
        child: ClipRRect(
          child: Image.asset(
            'images/iiumiaCrypto/ic_mastercard.jpg',
            height: 50,
            width: 50,
          ),
          borderRadius: radius(),
        ),
        decoration: boxDecorationDefault(color: ic_whiteColot, borderRadius: radius()),
      ),
      pText: 'Master Card',
      secText: '26.07.2019'));
  list.add(ICAddCardList(
      img: Container(
        child: Image.asset(
          'images/iiumiaCrypto/ic_visa.png',
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),
        decoration: BoxDecoration(
          borderRadius: radius(),
          color: Colors.blue,
        ),
      ),
      pText: 'Visa',
      secText: '5432'));
  list.add(ICAddCardList(
      img: Container(
        child: Image.asset(
          'images/iiumiaCrypto/ic_visa.png',
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),
        decoration: BoxDecoration(
          borderRadius: radius(),
          color: Colors.blue,
        ),
      ),
      pText: 'Visa',
      secText: '5432'));

  return list;
}

List<ICSettingsList> getSettingsList() {
  List<ICSettingsList> list = [];

  list.add(ICSettingsList(
      i: Icon(
        Icons.broken_image_outlined,
        color: ic_whiteColot,
      ),
      pText: 'Current Network',
      secText: 'Your main network',
      screen: ICNetworkScreen()));
  list.add(ICSettingsList(
      i: Icon(
        Icons.monetization_on_outlined,
        color: ic_whiteColot,
      ),
      pText: 'Default Currencies',
      secText: 'USD',
      screen: ICDefaultCurrenciesScreen()));
  list.add(ICSettingsList(
      i: Icon(
        Icons.lock_open,
        color: ic_whiteColot,
      ),
      pText: 'Change PIN',
      secText: 'Your can change PIN'));
  list.add(ICSettingsList(
      i: Icon(
        Icons.touch_app_outlined,
        color: ic_whiteColot,
      ),
      pText: 'Touch ID',
      secText: 'Check your Touch Id lock',
      screen: ICTouchIdScreen()));
  list.add(ICSettingsList(
      i: Icon(
        Icons.payment_outlined,
        color: ic_whiteColot,
      ),
      pText: 'Payment Method',
      secText: 'You can change your payment method'));
  list.add(ICSettingsList(
      i: Icon(
        Icons.money,
        color: ic_whiteColot,
      ),
      pText: 'Default Currencies',
      secText: 'Standard',
      screen: ICDefaultCurrenciesScreen()));
  list.add(ICSettingsList(
      i: Icon(
        Icons.android,
        color: ic_whiteColot,
      ),
      pText: 'App Version',
      secText: '2.1.1.3'));

  return list;
}

List<ICNetworkList> getNetworkList() {
  List<ICNetworkList> list = [];

  list.add(ICNetworkList(pText: 'AED', secText: 'United Arab Emirates Dirham', hide: true));
  list.add(ICNetworkList(pText: 'AFN', secText: 'Afghan Afghani ', hide: true));
  list.add(ICNetworkList(pText: 'ALL', secText: 'Albanian Lok', hide: true));
  list.add(ICNetworkList(pText: 'AMD', secText: 'Armenian Dram Dirham', hide: false));
  list.add(ICNetworkList(pText: 'ANG', secText: 'Netherlands ANtilean Builder', hide: false));

  return list;
}

List<ICCurrenciesList> getCurrenciesList() {
  List<ICCurrenciesList> list = [];

  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_US.png', pText: 'US Doller', secText: 'USD', hide: false));
  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_UK.png', pText: 'Euro', secText: 'EUR', hide: true));
  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_australia.png', pText: 'Australian Doller', secText: 'AUD', hide: false));
  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_argentina.png', pText: 'Argentine Peso', secText: 'ARS', hide: false));
  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_armenia.png', pText: 'Armina Dram', secText: 'AMD', hide: false));
  list.add(ICCurrenciesList(img: 'images/iiumiaCrypto/ic_bahrain.png', pText: 'Bahraini Dinar', secText: 'BDR', hide: false));

  return list;
}

List<ICCurrenciesList> getPriceList() {
  List<ICCurrenciesList> list = [];

  list.add(ICCurrenciesList(pText: 'High', secText: '  \$ 4,925.65'));
  list.add(ICCurrenciesList(pText: 'Vol', secText: '  \$ 55.65'));
  list.add(ICCurrenciesList(pText: 'Low', secText: ' \$ 4,701.63'));

  return list;
}

List<DetailCardTranList> getManagementList() {
  List<DetailCardTranList> list = [];

  list.add(DetailCardTranList(
    img: '14 Mar 2019',
    pText: '  13.34',
    secText: 'Receive fomr - 167...345',
    fig: '+0.001 RPL',
  ));

  return list;
}

List<DetailCardTranList> getLevelList() {
  List<DetailCardTranList> list = [];

  list.add(DetailCardTranList(pText: 'Highest'));
  list.add(DetailCardTranList(pText: 'Lowest Price'));
  list.add(DetailCardTranList(pText: 'Top 100'));
  list.add(DetailCardTranList(pText: 'Most'));

  return list;
}
