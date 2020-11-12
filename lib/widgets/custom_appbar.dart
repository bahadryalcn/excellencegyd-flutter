import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'package:websitegyd/widgets/top_bar_contents.dart';
import 'package:get/get.dart';

class CustomAppbar extends ChangeNotifier {
  Widget buildAppBar(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    notifyListeners();
    return (ResponsiveWidget.isSmallScreen(context)
        ? buildMobileAppBar(context)
        : buildDesktopAppBar(screenSize) as PreferredSizeWidget);
  }

  Widget buildDesktopAppBar(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: TopBarContents(),
    );
  }

  Widget buildMobileAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          color: Theme.of(context).accentColor,
          icon: Icon(
            Icons.brightness_6,
          ),
          focusColor: Colors.red,
          highlightColor: Colors.red,
          onPressed: () {
            DynamicTheme.of(context).setBrightness(
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark);
            print(Theme.of(context).brightness);
          },
        ),
      ],
      title: Text(
        'applicationName'.tr,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
        ),
      ),
    );
  }
}
