import 'package:flutter/widgets.dart';

class NavBarItemModel {
  final String title;
  final IconData iconData;
  final Widget navigationPath;
  final Route url;

  NavBarItemModel({this.title, this.iconData, this.navigationPath, this.url});
}
