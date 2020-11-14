import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitegyd/router/route_names.dart';
import 'package:websitegyd/view/about_us.dart';
import 'package:websitegyd/view/contact_us.dart';
import 'package:websitegyd/view/error_page.dart';
import 'package:websitegyd/extensions/strings_extensions.dart';
import 'package:websitegyd/view/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingdata = settings.name.getRoutingData;
  switch (routingdata.route) {
    case HomePageRoute:
      return _getPageRoute(HomePage(), settings);
    case AboutPageRoute:
      return _getPageRoute(AboutUs(), settings);
    case ContactPageRoute:
      return _getPageRoute(ContactUs(), settings);
    default:
      return _getPageRoute(ErrorPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,
    routeName: settings.name,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
