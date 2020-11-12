import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/widgets/responsive.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key key,
    // @required this.screenSize,
    // @required this.UniversalStrings.assetsFeaturesTiles,
    // @required this.UniversalStrings.titleFeaturesTiles,
  }) : super(key: key);

  // final List<String> UniversalStrings.assetsFeaturesTiles;

  // final List<String> UniversalStrings.titleFeaturesTiles;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? buildPaddingMobile(context, screenSize)
        : buildPaddingDesktop(context, screenSize);
  }

  Padding buildPaddingMobile(BuildContext context, Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height / 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: screenSize.width / 15),
            ...Iterable<int>.generate(
                    UniversalStrings.assetsFeaturesTiles.length)
                .map(
              (int pageIndex) => Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.width / 2.5,
                        width: screenSize.width / 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            UniversalStrings.assetsFeaturesTiles[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: Text(
                          UniversalStrings.titleFeaturesTiles[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1
                                .color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPaddingDesktop(BuildContext context, Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...Iterable<int>.generate(UniversalStrings.assetsFeaturesTiles.length)
              .map(
            (int pageIndex) => Column(
              children: [
                SizedBox(
                  height: screenSize.width / 6,
                  width: screenSize.width / 3.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      UniversalStrings.assetsFeaturesTiles[pageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height / 70,
                  ),
                  child: Text(
                    UniversalStrings.titleFeaturesTiles[pageIndex],
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryTextTheme.subtitle1.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
