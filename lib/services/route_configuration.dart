import 'package:flutter/material.dart';
import 'package:websitegyd/view/contact_us.dart';
import 'package:websitegyd/view/home.dart';
import 'package:websitegyd/constants/path.dart';

class RouteConfiguration {
  static List<Path> paths = [
    // Path(
    //   r'^/article/([\w-]+)$',
    //   (context, match) => Article.getArticlePage(match),
    // ),
    Path(
      r'^' + ContactUs.route,
      (context, match) => ContactUs(),
    ),
    Path(
      r'^' + HomePage.route,
      (context, match) => HomePage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    return null;
  }
}
