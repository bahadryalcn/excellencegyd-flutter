import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class LanguagesItem {
  Widget buildLanguageItem(BuildContext context);
}

class LanguageItemWidget implements LanguagesItem {
  final String name;
  final String iconPath;
  LanguageItemWidget(this.name, this.iconPath);

  Widget buildLanguageItem(BuildContext context) {
    print('gled');
    return Row(
      children: [
        Container(
          child: Image.asset(
            iconPath,
            fit: BoxFit.cover,
            height: 20,
            width: 30,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
