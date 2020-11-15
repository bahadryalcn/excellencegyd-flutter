import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/widgets/responsive.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key key,
    // @required this.screenSize,
    // @required this.UniversalString.titleDestinationHeading,
  }) : super(key: key);

  // final Size screenSize;
  // final String UniversalString.titleDestinationHeading;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? buildContainerMobile(screenSize)
        : buildContainerDesktop(context, screenSize);
  }

  Container buildContainerDesktop(BuildContext context, Size screenSize) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      // color: Colors.black,
      child: Text(
        UniversalStrings.titleDestinationHeading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor),
      ),
    );
  }

  Container buildContainerMobile(Size screenSize) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 20,
        bottom: screenSize.height / 20,
      ),
      width: screenSize.width,
      // color: Colors.black,
      child: Text(
        UniversalStrings.titleDestinationHeading,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
