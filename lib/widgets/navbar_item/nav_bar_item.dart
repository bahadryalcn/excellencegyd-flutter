import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/locator.dart';
import 'package:websitegyd/models/nav_bar_item_model.dart';

import 'package:websitegyd/widgets/navbar_item/nav_bar_item_desktop.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_item_mobile.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'package:websitegyd/extensions/extensions.dart';
import 'dart:html' as html;

class NavBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget navigationPath;
  final Route url;
  final String nav;
  const NavBarItem(
      this.title, this.icon, this.navigationPath, this.url, this.nav);
  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
        title: title, iconData: icon, navigationPath: navigationPath, url: url);

    return GestureDetector(
      onTap: () {
        if (ResponsiveWidget.isSmallScreen(context)) {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pushReplacement(url);
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => navigationPath));
          } else {
            Navigator.of(context).pushReplacement(url);
          }
        } else {
          // Get.to(navigationPath);
          // Navigator.of(context).pushReplacement(url);
          Navigator.restorablePopAndPushNamed(context, url.settings.name);
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => navigationPath));
          // Navigator.of(context).pushNamed(url.settings.name);
        }
      },
      child: Provider.value(
        value: model,
        child: ResponsiveWidget.isSmallScreen(context)
            ? NavBarItemMobile()
            : NavBarItemDesktop(),
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}
