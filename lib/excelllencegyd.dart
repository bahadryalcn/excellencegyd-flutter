import 'package:websitegyd/services/localization_services.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/route_configuration.dart';
// import 'package:websitegyd/services/route_configuration.dart';
// import 'package:websitegyd/view/contact_us.dart';
import 'package:websitegyd/view/home.dart';

class ExcellenceGYD extends StatefulWidget {
  @override
  _ExcellenceGYDState createState() => _ExcellenceGYDState();
}

/// flutter pub global run peanut:peanut

class _ExcellenceGYDState extends State<ExcellenceGYD> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        return brightness == Brightness.light
            ? buildLightThemeData(context, brightness)
            : buildDarkThemeData(context, brightness);
      },
      themedWidgetBuilder: (context, data) => buildGetMaterialApp(data),
    );
  }

  GetMaterialApp buildGetMaterialApp(ThemeData data) {
    return GetMaterialApp(
      initialRoute: HomePage.route,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
      title: "Excellence GYD",
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,
      locale: LocalizationService.locale,
      theme: data,
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData buildDarkThemeData(BuildContext context, Brightness brightness) {
    return ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.white,
      backgroundColor: Colors.black,
      cardColor: Colors.red,
      shadowColor: Colors.red[200],
      highlightColor: Colors.red,
      hoverColor: Colors.black54,
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.white,
          decorationColor: Colors.black,
        ),
        subtitle2: TextStyle(
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          color: Colors.white,
        ),
        headline1: TextStyle(
          color: Colors.red,
        ),
      ),
      bottomAppBarColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      brightness: brightness,
    );
  }

  ThemeData buildLightThemeData(BuildContext context, Brightness brightness) {
    return ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.black,
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      hoverColor: Colors.white70,
      highlightColor: Colors.red.withOpacity(0.7),
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.black,
          decorationColor: Colors.red,
        ),
        subtitle2: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        headline1: TextStyle(color: Colors.red),
      ),
      bottomAppBarColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      brightness: brightness,
    );
  }
}
