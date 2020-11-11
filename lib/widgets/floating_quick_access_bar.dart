import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key key,
    @required this.screenSize,
    @required this.items,
    @required this.isHovering,
    @required this.icons,
  }) : super(key: key);

  final Size screenSize;
  final List<String> items;
  final List isHovering;
  final List<IconData> icons;
  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List<Widget> rowElements = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? buildColumnCardMobile(context)
            : buildCardDesktop(),
      ),
    );
  }

  Card buildCardDesktop() {
    return Card(
      shadowColor: Theme.of(context).accentColor,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height / 50,
          bottom: widget.screenSize.height / 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: generateRowElements(),
        ),
      ),
    );
  }

  Column buildColumnCardMobile(BuildContext context) {
    return Column(
      children: [
        ...Iterable<int>.generate(widget.items.length).map(
          (int pageIndex) => Padding(
            padding: EdgeInsets.only(top: widget.screenSize.height / 80),
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.only(
                    top: widget.screenSize.height / 45,
                    bottom: widget.screenSize.height / 45,
                    left: widget.screenSize.width / 20),
                child: Row(
                  children: [
                    Icon(
                      widget.icons[pageIndex],
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(width: widget.screenSize.width / 20),
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        widget.items[pageIndex],
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

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < widget.items.length; i++) {
      Widget elementTile = buildInkWell(i);
      Widget spacer = buildSpacerSizedBox();
      rowElements.add(elementTile);
      if (i < widget.items.length - 1) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  Row buildInkWell(int i) {
    return Row(
      children: [
        Icon(
          widget.icons[i],
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
                  ? widget.isHovering[i] = true
                  : widget.isHovering[i] = false;
            });
          },
          onTap: () {},
          child: Text(
            widget.items[i],
            style: TextStyle(
              color: widget.isHovering[i]
                  ? Theme.of(context).primaryTextTheme.button.decorationColor
                  : Theme.of(context).primaryTextTheme.button.color,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildSpacerSizedBox() {
    return SizedBox(
      height: widget.screenSize.height / 20,
      child: VerticalDivider(
        width: 1,
        color: Theme.of(context).accentColor,
        thickness: 1,
      ),
    );
  }
}
