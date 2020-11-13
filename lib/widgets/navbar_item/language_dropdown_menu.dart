import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/localization_services.dart';
import 'package:websitegyd/widgets/languages_item.dart';

class LanguageDropDownMenu extends StatelessWidget {
  static LanguageItemWidget dropdownValue;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
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
          _bids(context);
        } catch (ee) {
          print(ee.toString());
        }
      },
    );
  }

  Future<void> setInitialPreferences() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("applicationLang", Get.locale.toString()).then(
          (bool success) {},
        );
  }

  void _bids(BuildContext context) async {
    await Future<void>.delayed(Duration(milliseconds: 500));
    if (LocalizationService().changeLocale(dropdownValue.name)) {
      LocalizationService().changeLocale(dropdownValue.name);
      setInitialPreferences();
      showDialog(
        context: context,
        builder: (context) {
          return dialogWidget(context);
        },
      );
      Timer(Duration(milliseconds: 1200), () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  Dialog dialogWidget(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UniversalStrings.desktopPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: screenSize.height * 0.2,
        width: screenSize.width * 0.3,
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
}
