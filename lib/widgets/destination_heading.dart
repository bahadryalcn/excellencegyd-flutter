import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/responsive.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key key,
    @required this.screenSize,
    @required this.title,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? buildContainerMobile()
        : buildContainerDesktop(context);
  }

  Container buildContainerDesktop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      // color: Colors.black,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor),
      ),
    );
  }

  Container buildContainerMobile() {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 20,
        bottom: screenSize.height / 20,
      ),
      width: screenSize.width,
      // color: Colors.black,
      child: Text(
        title,
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
