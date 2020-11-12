import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/services/localization_services.dart';
import 'package:websitegyd/view/error_page.dart';
import 'package:websitegyd/widgets/bottom_bar.dart';
import 'package:websitegyd/widgets/carousel.dart';
import 'package:websitegyd/widgets/custom_appbar.dart';
import 'package:websitegyd/widgets/destination_heading.dart';
import 'package:websitegyd/widgets/explore_drawer.dart';
import 'package:websitegyd/widgets/featured_heading.dart';
import 'package:websitegyd/widgets/featured_tiles.dart';
import 'package:websitegyd/widgets/floating_quick_access_bar.dart';
import 'package:websitegyd/widgets/responsive.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> applicationLang;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    initLocalization();
  }

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
                child: const CircularProgressIndicator());
            break;
          default:
            if (snapshot.hasError) {
              return ErrorPage();
            } else {
              return buildScaffold(context, screenSize);
            }
        }
      },
    );
  }

  Scaffold buildScaffold(BuildContext context, Size screenSize) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().buildAppBar(context),
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: Theme.of(context).accentColor,
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
                        UniversalStrings.mainImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
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
                ],
              ),
              DestinationHeading(),
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
}
