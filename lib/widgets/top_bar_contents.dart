import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/localization_services.dart';

// ignore: must_be_immutable
class TopBarContents extends StatelessWidget {
  static String dropdownValue;
  // static String dropdownValue;
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

  TopBarContents();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: EdgeInsets.all(20),
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
                    SizedBox(width: screenSize.width / 8),
                    buildInkWell(context, 'home_page'.tr, 0),
                    SizedBox(width: screenSize.width / 20),
                    buildInkWell(context, 'contact_us'.tr, 1),
                  ],
                ),
              ),
              IconButton(
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
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              buildInkWell(context, 'sign_in_button'.tr, 3),
              SizedBox(
                width: screenSize.width / 50,
              ),
              buildLanguage(context, 4),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton buildLanguage(BuildContext context, int index) {
    return DropdownButton(
      hint: Text(
        'language'.tr,
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      dropdownColor: Theme.of(context).hoverColor,
      value: dropdownValue,
      items: LocalizationService.langs
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        );
      }).toList(),
      onChanged: (newvalue) {
        dropdownValue = newvalue;
        print('Index' + newvalue.toString());
        LocalizationService().changeLocale(LocalizationService
            .langs[LocalizationService.langs.indexOf(newvalue)]
            .toString());
      },
    );
  }

  InkWell buildInkWell(BuildContext context, String name, int index) {
    return InkWell(
      onHover: (value) {
        // setState(() {
        value ? _isHovering[index] = true : _isHovering[index] = false;
        // });
      },
      onTap: () {},
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
