import 'package:flutter/material.dart';
import 'package:websitegyd/view/static_page.dart';
import 'package:websitegyd/widgets/carousel.dart';
import 'package:websitegyd/widgets/destination_heading.dart';
import 'package:websitegyd/widgets/featured_heading.dart';
import 'package:websitegyd/widgets/featured_tiles.dart';
import 'package:websitegyd/widgets/floating_quick_access_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaticPage(
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
