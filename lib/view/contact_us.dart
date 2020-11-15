import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/router/router.dart';
import 'package:websitegyd/view/static_page.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'dart:html' as html;

class ContactUs extends StatefulWidget {
  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/contact',
      title: 'Contact Us',
      builder: (_) => ContactUs(),
    );
  }

  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/contact',
      title: 'Contact Us',
      builder: (_) => ContactUs(),
    );
  }

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> pageHistory = [];
  Future<void> pageHistoryFunc() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getInt('control') != 2) {
      pageHistory.addAll(prefs.getStringList('pageHistory'));
      pageHistory.add('/contact');
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

  // Future<void> aaa() async {
  //   final SharedPreferences prefs = await _prefs;
  //   if (prefs.getStringList('pageHistory').length > 0) {
  //     pageHistory = prefs.getStringList('pageHistory');
  //     if (pageHistory.isNotEmpty) {
  //       pageHistory.removeLast();
  //       print(prefs.getStringList('pageHistory'));
  //       if (pageHistory.length > 0) {
  //         String a = pageHistory.elementAt(pageHistory.length - 1);
  //         print(a);
  //         prefs.setStringList("pageHistory", pageHistory).then(
  //               (bool success) {},
  //             );
  //         print(prefs.getStringList('pageHistory'));
  //         // Navigator.of(context).popAndPushNamed(routeName)
  //       }
  //     } else {
  //       print('Null');
  //     }
  //   } else {
  //     print('Null 2');
  //   }
  // }
  final GlobalKey scaffoldContact = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StaticPage(
      scaffoldKey: scaffoldContact,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.message,
                              size: 30,
                            ),
                            Text(
                              '     Whatsapp\n+905320629756',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () {
                            FlutterOpenWhatsapp.sendSingleMessage(
                                "905320629756", "Hello");
                          },
                          color: Colors.red,
                          child: Text(
                            'Send message us \n by Whatsapp',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.message,
                              size: 30,
                            ),
                            Text(
                              'Whatsapp: +905320629756',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () {
                            FlutterOpenWhatsapp.sendSingleMessage(
                                "905320629756", "Hello");
                          },
                          color: Colors.red,
                          child: Text(
                            'Send message us by Whatsapp',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   height: screenSize.height * 0.3,
          //   width: screenSize.width * 0.3,
          //   child: Card(
          //     elevation: 10,
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   height: screenSize.height * 0.3,
          //   width: screenSize.width * 0.3,
          //   child: Card(
          //     elevation: 10,
          //   ),
          // ),
        ],
      ),
    );
  }
}
