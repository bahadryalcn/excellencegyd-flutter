import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/widgets/languages_item.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/localization_services.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  static LanguageItemWidget dropdownValue;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var _screenSize;

  int dialogActive = 0;
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(UniversalStrings.mobilePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildLanguageDropDownMenu(context),
              buildSizedBoxDivider(20),
              buildSizedBoxDivider(20),
              buildInkWell(context, 'home_page'.tr),
              buildMobileDrawerDiveder(context),
              buildInkWell(context, 'contact_us'.tr),
              buildBottomDesc(context, 'copyright'.tr),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBoxDivider(double value) => SizedBox(height: value);

  DropdownButton<LanguagesItem> buildLanguageDropDownMenu(
      BuildContext context) {
    var initialLanguage =
        LocalizationService().getLanguageFromLocale(Get.locale.toString());

    return DropdownButton(
      icon: Icon(Icons.arrow_downward),
      iconEnabledColor: Theme.of(context).accentColor,
      hint: initialLanguage.buildLanguageItem(context),
      dropdownColor: Theme.of(context).hoverColor,
      value: dropdownValue,
      items: UniversalStrings.languageItems
          .map<DropdownMenuItem<LanguagesItem>>((value) {
        return DropdownMenuItem<LanguagesItem>(
          value: value,
          child: value.buildLanguageItem(context),
        );
      }).toList(),
      onTap: () {},
      onChanged: (newvalue) {
        try {
          dropdownValue = newvalue;
          _bids();
        } catch (ee) {
          print(ee.toString());
        }
      },
    );
  }

  void _bids() async {
    await Future<void>.delayed(Duration(milliseconds: 500));
    if (LocalizationService().changeLocale(dropdownValue.name)) {
      LocalizationService().changeLocale(dropdownValue.name);
      setInitialPreferences();
      showDialog(
        context: context,
        builder: (context) {
          return dialogWidget();
        },
      );
      Timer(Duration(milliseconds: 1200), () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  Future<void> setInitialPreferences() async {
    final SharedPreferences prefs = await _prefs;
    prefs
        .setString("applicationLang", Get.locale.toString())
        .then((bool success) {});
  }

  Dialog dialogWidget() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UniversalStrings.mobilePadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: _screenSize.height * 0.4,
        width: _screenSize.width * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: UniversalStrings.mobilePadding,
                  bottom: UniversalStrings.mobilePadding),
              child: Text(
                'language_changed'.tr,
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ),
            RaisedButton(
              color: Theme.of(context).canvasColor,
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'okey'.tr,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Expanded buildBottomDesc(BuildContext context, String text) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Container buildFlatButton(BuildContext context, String text) {
    return Container(
      width: double.maxFinite,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        highlightColor: Colors.red,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: UniversalStrings.mobilePadding,
            bottom: UniversalStrings.mobilePadding,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildMobileDrawerDiveder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: UniversalStrings.mobilePadding2,
          bottom: UniversalStrings.mobilePadding2),
      child: Divider(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.red,
        thickness: 2,
      ),
    );
  }

  InkWell buildInkWell(BuildContext context, String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
