import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/nav_bar/desktop_navigation_bar.dart';
import 'package:websitegyd/widgets/nav_bar/mobile_navigation_bar.dart';
import 'package:websitegyd/widgets/responsive.dart';

class AboutUs extends StatefulWidget {
  // static const String route = '/contact';
  // static const String baseRoute = '/article';
  // static String Function(String slug) routeFromSlug =
  //     (String slug) => route + '/$slug';
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              return Column(children: [
                ResponsiveWidget.isSmallScreen(context)
                    ? MobileNavigationBar()
                    : DesktopNavigationBar(),
                Stack(children: [
                  Container(
                    child: Center(
                      child: Text(
                        'About',
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 50),
                      ),
                    ),
                  )
                ])
              ]);
            },
          ),
        ),
      ),
    );
  }
}
