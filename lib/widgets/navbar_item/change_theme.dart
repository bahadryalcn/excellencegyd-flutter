import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildIconButton(context);
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.brightness_6),
      splashColor: Colors.red,
      splashRadius: 500,
      color: Theme.of(context).accentColor,
      onPressed: () {
        DynamicTheme.of(context).setBrightness(
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark);
      },
    );
  }
}
