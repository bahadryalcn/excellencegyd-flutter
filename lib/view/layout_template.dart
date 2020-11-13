// import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class LayoutTemplate extends StatefulWidget {
  final Widget child;

  const LayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  final GlobalKey scaffoldLayoutTempKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // key: scaffoldLayoutTempKey,
      // backgroundColor: Theme.of(context).backgroundColor,
      // extendBodyBehindAppBar: true,
      // // appBar: buildCustomAppBar(screenSize, context),
      // drawerEnableOpenDragGesture: true,
      // drawerScrimColor: Theme.of(context).accentColor,
      // drawer:
      body: widget.child,
    );
  }
}
