import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  TranslateOnHover({Key key, this.child}) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        decoration: BoxDecoration(
          // color: _hovering
          //     ? Theme.of(context).primaryColor
          //     : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),

          gradient: _hovering
              ? LinearGradient(colors: [
                  Colors.red.withOpacity(0.4),
                  Theme.of(context).backgroundColor.withOpacity(0.6)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
              : LinearGradient(colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).backgroundColor
                ]),
        ),
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
