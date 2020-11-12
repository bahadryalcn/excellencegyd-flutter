import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/widgets/bottom_bar.dart';
import 'package:websitegyd/widgets/carousel.dart';
import 'package:websitegyd/widgets/destination_heading.dart';
import 'package:websitegyd/widgets/explore_drawer.dart';
import 'package:websitegyd/widgets/featured_heading.dart';
import 'package:websitegyd/widgets/featured_tiles.dart';
import 'package:websitegyd/widgets/floating_quick_access_bar.dart';
import 'package:websitegyd/widgets/responsive.dart';
import 'package:websitegyd/widgets/top_bar_contents.dart';
// import 'package:websitegyd/widgets/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  // static String applicationLanguage = Get.locale.toString();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  List _isHoveringFloatingQuickAccess = [false, false, false, false];
  List<String> _itemsFloatingQuickAccess = [
    'Bahadır',
    'Halil',
    'Yalçın',
    'Excellence GYD'
  ];
  List<IconData> _iconsFloatingQuickAccess = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  //Featured Heading variables
  String _titleFeaturedHeading = "Features";
  String _subtitleFeaturedHeading = "Test excellence gyd";

  //Features Tiles variables
  List<String> _assetsFeaturesTiles = [
    'assets/images/main_home1.jpg',
    'assets/images/main_home2.jpg',
    'assets/images/main_home3.jpg',
  ];

  // Title Features Tiles
  List<String> _titleFeaturesTiles = [
    'Home 1',
    'Home 2',
    'Home 2',
  ];
  String _titleDestinationHeading = "Projects";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? buildMobileAppBar(context)
          : buildDesktopAppBar(screenSize),
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.red
          : Colors.black,
      drawer: ResponsiveWidget.isSmallScreen(context) ? ExploreDrawer() : null,
      body: buildBody(context, screenSize),
    );
  }

  Widget buildBody(BuildContext context, Size screenSize) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
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
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.45,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/istanbul.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(
                        screenSize: screenSize,
                        items: _itemsFloatingQuickAccess,
                        isHovering: _isHoveringFloatingQuickAccess,
                        icons: _iconsFloatingQuickAccess,
                      ),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(
                              screenSize: screenSize,
                              title: _titleFeaturedHeading,
                              subTitle: _subtitleFeaturedHeading,
                            ),
                            FeaturedTiles(
                              screenSize: screenSize,
                              assets: _assetsFeaturesTiles,
                              title: _titleFeaturesTiles,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DestinationHeading(
                screenSize: screenSize,
                title: _titleDestinationHeading,
              ),
              DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          );
        },
      ),
      // ),
    );
  }

  PreferredSize buildDesktopAppBar(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: TopBarContents(),
    );
  }

  AppBar buildMobileAppBar(BuildContext context) {
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

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.pink],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'applicationName'.tr,
              style: TextStyle(
                fontSize: deviceSize.width / 20.toInt(),
                color: Colors.white,
              ),
            ),
            Text(
              'something_went_wrong'.tr,
              style: TextStyle(
                fontSize: deviceSize.width / 50.toInt(),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
