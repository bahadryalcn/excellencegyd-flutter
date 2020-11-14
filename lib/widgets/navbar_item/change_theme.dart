import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.brightness_6_outlined),
      onPressed: () {
        DynamicTheme.of(context).setBrightness(
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark);
      },
    );
  }
}
