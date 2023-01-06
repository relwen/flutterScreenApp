import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECInvoiceInfo.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECElectronicInvoiceScreen extends StatefulWidget {
  @override
  _ECElectronicInvoiceScreenState createState() => _ECElectronicInvoiceScreenState();
}

class _ECElectronicInvoiceScreenState extends State<ECElectronicInvoiceScreen> {
  bool? val = false;
  TextEditingController compCont = TextEditingController();
  TextEditingController taxCont = TextEditingController();
  TextEditingController addCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Electronic Invoice', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheckboxListTile(
              value: val,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  this.val = value;
                });
              },
              title: Text('Invoice address is the same as receiving address', style: secondaryTextStyle()),
            ),
            8.height,
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              decoration: boxDecorationRoundedWithShadow(
                16,
                blurRadius: 0.6,
                spreadRadius: 0.3,
                shadowColor: gray.withOpacity(0.3),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Invoice Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  16.height,
                  AppTextField(
                    controller: compCont,
                    textFieldType: TextFieldType.NAME,
                    decoration: inputDecoration(icon: Icons.shield, hintText: 'Company Name'),
                  ),
                  16.height,
                  AppTextField(
                    controller: taxCont,
                    textFieldType: TextFieldType.PHONE,
                    decoration: inputDecoration(icon: Icons.shopping_bag, hintText: 'TaxCode'),
                  ),
                  16.height,
                  AppTextField(
                    controller: addCont,
                    textFieldType: TextFieldType.NAME,
                    decoration: inputDecoration(icon: Icons.location_on, hintText: 'Address'),
                  ),
                  TextButton(
                    child: Text('Details', style: boldTextStyle(color: ec_seaBlue)),
                    onPressed: () {
                      ECInvoiceInfo().launch(context);
                    },
                  ),
                ],
              ),
            ),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(
                16,
                blurRadius: 0.6,
                spreadRadius: 0.3,
                shadowColor: gray.withOpacity(0.3),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Note: ', style: boldTextStyle(size: 20)),
                  16.height,
                  Text(
                    'For Products belonging to suppliers other than X, you will be supported with invoice issued within 14 days from the time of successful receipt of goods and no need to return.',
                    style: secondaryTextStyle(),
                  ),
                  16.height,
                  Text(
                    'In Case the customer does not enter invoice information, X Trading will issue an invoice according to the purchase information.',
                    style: secondaryTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
