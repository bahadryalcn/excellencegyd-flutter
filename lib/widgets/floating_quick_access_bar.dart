import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/widgets/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key key,
  }) : super(key: key);

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List<Widget> rowElements = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? buildCardMobile(context, screenSize)
            : buildCardDesktop(screenSize),
      ),
    );
  }

  Card buildCardDesktop(Size screenSize) {
    return Card(
      shadowColor: Theme.of(context).accentColor,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height / 50,
          bottom: screenSize.height / 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: generateRowElements(screenSize),
        ),
      ),
    );
  }

  Column buildCardMobile(BuildContext context, Size screenSize) {
    return Column(
      children: [
        ...Iterable<int>.generate(
          UniversalStrings.itemsFloatingQuickAccess.length,
        ).map(
          (int pageIndex) => Padding(
            padding: EdgeInsets.only(top: screenSize.height / 80),
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height / 45,
                    bottom: screenSize.height / 45,
                    left: screenSize.width / 20),
                child: Row(
                  children: [
                    Icon(
                      UniversalStrings.iconsFloatingQuickAccess[pageIndex],
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        UniversalStrings.itemsFloatingQuickAccess[pageIndex],
                        style: TextStyle(
                            color:
                                Theme.of(context).primaryTextTheme.button.color,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> generateRowElements(Size screenSize) {
    rowElements.clear();
    for (int i = 0; i < UniversalStrings.itemsFloatingQuickAccess.length; i++) {
      Widget elementTile = buildInkWell(i);
      Widget spacer = buildSpacerSizedBox(screenSize);
      rowElements.add(elementTile);
      if (i < UniversalStrings.itemsFloatingQuickAccess.length - 1) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  Row buildInkWell(int i) {
    return Row(
      children: [
        Icon(
          UniversalStrings.iconsFloatingQuickAccess[i],
          color: Theme.of(context).iconTheme.color,
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onHover: (value) {
            setState(() {
              value
                  ? UniversalStrings.isHoveringFloatingQuickAccess[i] = true
                  : UniversalStrings.isHoveringFloatingQuickAccess[i] = false;
            });
          },
          onTap: () {},
          child: Text(
            UniversalStrings.itemsFloatingQuickAccess[i],
            style: TextStyle(
              color: UniversalStrings.isHoveringFloatingQuickAccess[i]
                  ? Theme.of(context).primaryTextTheme.button.decorationColor
                  : Theme.of(context).primaryTextTheme.button.color,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildSpacerSizedBox(Size screenSize) {
    return SizedBox(
      height: screenSize.height / 20,
      child: VerticalDivider(
        width: 1,
        color: Theme.of(context).accentColor,
        thickness: 1,
      ),
    );
  }
}
