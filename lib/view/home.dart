import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/router/router.dart';
import 'package:websitegyd/view/static_page.dart';
import 'package:websitegyd/widgets/carousel.dart';
import 'package:websitegyd/widgets/destination_heading.dart';
import 'package:websitegyd/widgets/featured_heading.dart';
import 'package:websitegyd/widgets/featured_tiles.dart';
import 'package:websitegyd/widgets/floating_quick_access_bar.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/home',
      title: 'Home Page',
      builder: (_) => HomePage(),
    );
  }

  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/home',
      title: 'Home Page',
      builder: (_) => HomePage(),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey scaffoldHome = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return StaticPage(
      scaffoldKey: scaffoldHome,
      stack: Column(
        children: [
          FloatingQuickAccessBar(),
          Container(
            child: Column(
              children: [
                FeaturedHeading(),
                FeaturedTiles(),
              ],
            ),
          ),
        ],
      ),
      column: Column(
        children: [
          DestinationHeading(),
          DestinationCarousel(),
        ],
      ),
    );
  }
}
