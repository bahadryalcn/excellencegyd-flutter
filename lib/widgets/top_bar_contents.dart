import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/widgets/languages_item.dart';
import 'package:websitegyd/services/localization_services.dart';

// ignore: must_be_immutable
class TopBarContents extends StatefulWidget {
  TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  static LanguageItemWidget dropdownValue;
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  var _screenSize;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(_screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: EdgeInsets.all(UniversalStrings.desktopPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'applicationName'.tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildSizedBoxDivider(8),
                    buildInkWell(context, 'home_page'.tr, 0),
                    buildSizedBoxDivider(20),
                    buildInkWell(context, 'contact_us'.tr, 1),
                  ],
                ),
              ),
              buildChangeThemeIcon(context),
              buildSizedBoxDivider(50),
              buildInkWell(context, 'sign_in_button'.tr, 3),
              buildSizedBoxDivider(50),
              buildLanguageDropDownMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBoxDivider(int value) {
    return SizedBox(
      width: _screenSize.width / value,
    );
  }

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
      // HomePage().app
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
        borderRadius: BorderRadius.circular(UniversalStrings.desktopPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: _screenSize.height * 0.2,
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
                  top: UniversalStrings.desktopPadding,
                  bottom: UniversalStrings.desktopPadding),
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
    );
  }

  IconButton buildChangeThemeIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.brightness_6),
      splashColor: Colors.red,
      splashRadius: 1000,
      color: Theme.of(context).accentColor,
      onPressed: () {
        DynamicTheme.of(context).setBrightness(
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark);
      },
    );
  }

  InkWell buildInkWell(BuildContext context, String name, int index) {
    return InkWell(
      onHover: (value) {
        value ? _isHovering[index] = true : _isHovering[index] = false;
      },
      onTap: () {
        //
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
                color: _isHovering[index]
                    ? Colors.red.withOpacity(0.7)
                    : Theme.of(context).accentColor),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering[index],
            child: Container(
              height: 2,
              width: 20,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
