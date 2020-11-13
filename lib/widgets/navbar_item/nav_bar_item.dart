import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:websitegyd/models/nav_bar_item_model.dart';
import 'package:websitegyd/services/navigation_service.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_item_desktop.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_item_mobile.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'package:websitegyd/extensions/extensions.dart';
import '../../locator.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const NavBarItem(this.title, this.icon, this.navigationPath);
  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      iconData: icon,
      navigationPath: navigationPath,
    );
    return GestureDetector(
      onTap: () {
        print(navigationPath);
        if (ResponsiveWidget.isSmallScreen(context)) {
          if (Navigator.canPop(context)) {
            locator<NavigationService>().navigateTo(navigationPath);
          } else {
            locator<NavigationService>().navigateTo(navigationPath);
          }
        } else {
          locator<NavigationService>().navigateTo(navigationPath);
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
