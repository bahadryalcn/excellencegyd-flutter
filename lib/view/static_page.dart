import 'dart:async';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/router/router.dart';
import 'package:websitegyd/services/localization_services.dart';
import 'package:websitegyd/view/error_page.dart';
import 'package:websitegyd/widgets/bottom_bar.dart';
import 'package:websitegyd/widgets/header_item.dart';
import 'package:websitegyd/widgets/nav_bar/desktop_navigation_bar.dart';
import 'package:websitegyd/widgets/nav_bar/mobile_drawer.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'package:get/get.dart';

class StaticPage extends StatefulWidget {
  // static const String route = '/';
  const StaticPage({
    Key key,
    @required this.stack,
    @required this.column,
    @required this.scaffoldKey,
  }) : super(key: key);

  final Widget stack;
  final Widget column;
  final Key scaffoldKey;

  @override
  _StaticPageState createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    initLocalization();
    _scrollController = ScrollController();
  }

  final GlobalKey scaffoldLayoutTempKey = new GlobalKey();
  Future<String> applicationLang;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> initLocalization() async {
    final SharedPreferences prefs = await _prefs;
    Locale initLang = LocalizationService()
        .getLocalLanguage(prefs.getString('applicationLang'));
    LocalizationService.locale = initLang;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: applicationLang,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
            break;
          default:
            if (snapshot.hasError) {
              return ErrorPage();
            } else {
              return Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: buildAppBar(context),
                key: widget.scaffoldKey,
                drawer: ResponsiveWidget.isSmallScreen(context)
                    ? MobileDrawer()
                    : null,
                drawerEnableOpenDragGesture: true,
                drawerScrimColor: Theme.of(context).accentColor,
                body: Container(
                  child: Scrollbar(
                    controller: _scrollController,
                    thickness: 5,
                    radius: Radius.circular(5),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: 1,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                HeaderItem(),
                                Column(
                                  children: [
                                    widget.stack,
                                  ],
                                ),
                              ],
                            ),
                            widget.column,
                            SizedBox(height: screenSize.height / 10),
                            BottomBar(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }

  Widget buildAppBar(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ResponsiveWidget.isSmallScreen(context)
        ? buildMobileAppBar(context)
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: DesktopNavigationBar(),
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
