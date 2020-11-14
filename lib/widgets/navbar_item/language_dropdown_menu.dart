import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/localization_services.dart';
import 'package:websitegyd/widgets/languages_item.dart';

class LanguageDropDownMenu extends StatefulWidget {
  static LanguageItemWidget dropdownValue;

  @override
  _LanguageDropDownMenuState createState() => _LanguageDropDownMenuState();
}

class _LanguageDropDownMenuState extends State<LanguageDropDownMenu> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    var initialLanguage =
        LocalizationService().getLanguageFromLocale(Get.locale.toString());

    return DropdownButton(
      icon: Icon(Icons.arrow_downward),
      // iconEnabledColor: Theme.of(context).accentColor,
      hint: initialLanguage.buildLanguageItem(context),
      dropdownColor: Theme.of(context).hoverColor,
      value: LanguageDropDownMenu.dropdownValue,
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
          LanguageDropDownMenu.dropdownValue = newvalue;
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
    await Future<void>.delayed(Duration(milliseconds: 1000));
    if (LocalizationService()
        .changeLocale(LanguageDropDownMenu.dropdownValue.name)) {
      Timer(Duration(milliseconds: 500), () {
        LocalizationService()
            .changeLocale(LanguageDropDownMenu.dropdownValue.name);
        setInitialPreferences();
      });

      // showDialog(
      //   context: context,
      //   builder: (context) {
      // return dialogWidget(context);
      //   },
      // );

      // Timer(Duration(milliseconds: 500), () {
      //   if (Navigator.canPop(context)) {
      //     Navigator.of(context).pop();
      //   }
      // });
    }
  }
}

Visibility dialogWidget(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 2;
  return Visibility(
    child: GestureDetector(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UniversalStrings.desktopPadding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          height: screenSize.height * 0.4,
          width: screenSize.width * 0.3,
          decoration: BoxDecoration(
            // color: Theme.of(context).accentColor,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.pink],
            ),
          ),
          child: CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                Timer(Duration(milliseconds: 500), () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                });
                return Column(
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
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'okey'.tr,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.white,
              );
            },
          ),
        ),
      ),
    ),
  );
}
