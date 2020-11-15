import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/router/router.dart';
import 'package:websitegyd/view/static_page.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'dart:html' as html;

class AboutUs extends StatefulWidget {
  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/about',
      title: 'About Us',
      builder: (_) => AboutUs(),
    );
  }

  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/about',
      title: 'About Us',
      builder: (_) => AboutUs(),
    );
  }

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> pageHistory = [];
  Future<void> pageHistoryFunc() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getInt('control') != 2) {
      pageHistory.addAll(prefs.getStringList('pageHistory'));
      pageHistory.add('/about');
      prefs.setStringList("pageHistory", pageHistory).then(
            (bool success) {},
          );
      print(prefs.getStringList('pageHistory'));
    } else {
      print('Normal button');
    }
  }

  @override
  void initState() {
    // html.window.history.pushState('a', "Home Pageaaaaa", "/home");
    super.initState();

    // pageHistoryFunc();
  }

  final GlobalKey scaffoldAbout = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StaticPage(
      scaffoldKey: scaffoldAbout,
      stack: Column(
        children: [
          // FloatingQuickAccessBar(),
          Container(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
      column: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? Container(
                  padding: const EdgeInsets.all(16),
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.7,
                  child: Card(
                    elevation: 10,
                    color: Theme.of(context).canvasColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                            'About',
                            style: TextStyle(fontSize: 40),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(16),
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.5,
                  child: Card(
                    elevation: 10,
                    color: Theme.of(context).canvasColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                            'About',
                            style: TextStyle(fontSize: 40),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
