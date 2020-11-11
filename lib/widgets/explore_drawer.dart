import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/models/languages_item.dart';
import 'package:websitegyd/services/localization_services.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  // bool _isProcessing = false;
  //Languages Items
  // String _selectedLang = LocalizationService.langs.first;
  static LanguagesItem dropdownValue;
  final List<LanguagesItem> languageItems = [
    LanguageItemWidget('Türkçe', 'assets/images/flags/tr.png'),
    LanguageItemWidget('中文', 'assets/images/flags/cn.png'),
    LanguageItemWidget('English', 'assets/images/flags/uk.png'),
    LanguageItemWidget('Deutsche', 'assets/images/flags/de.png'),
    LanguageItemWidget('Français', 'assets/images/flags/fr.png'),
    LanguageItemWidget('Italiano', 'assets/images/flags/it.png'),
    LanguageItemWidget('عربى', 'assets/images/flags/ar.png'),
    LanguageItemWidget('日本人', 'assets/images/flags/ja.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Language Drowdown Button
              buildLanguage(context),
              SizedBox(height: 20),
              SizedBox(height: 20),
              buildInkWell(context, 'Home Page'),
              buildMobileDrawerDiveder(context),
              buildInkWell(context, 'Contact Us'),
              buildBottomDesc(context, 'Copyright © 2020 | Excellence GYD'),
            ],
          ),
        ),
      ),
    );
  }

  Row buildLanguage(BuildContext context) {
    return Row(
      children: [
        Text(
          'Language',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 22,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        DropdownButton(
          dropdownColor: Theme.of(context).hoverColor,
          value: dropdownValue,
          items: languageItems.map(
            (user) {
              return DropdownMenuItem(
                value: user,
                child: user.buildLanguageItem(context),
              );
            },
          ).toList(),
          onChanged: (value) {
            dropdownValue = value;
            LocalizationService().changeLocale(LocalizationService
                .langs[UniversalStrings.languageItems.indexOf(value)]
                .toString());
          },
        ),
      ],
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
            top: 15.0,
            bottom: 15.0,
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
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
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
