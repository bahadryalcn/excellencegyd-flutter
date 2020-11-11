import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/responsive.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
    @required this.screenSize,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? buildColumnMobile(context)
          : buildRowDesktop(context),
    );
  }

  Column buildColumnMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          subTitle,
          textAlign: TextAlign.end,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Row buildRowDesktop(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Featured',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            'Unique wildlife tours & destinations',
            textAlign: TextAlign.end,
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
