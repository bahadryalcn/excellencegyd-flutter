import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          color: Theme.of(context).accentColor,
          icon: Icon(
            Icons.brightness_6,
          ),
          focusColor: Colors.red,
          highlightColor: Colors.red,
          onPressed: () {
            DynamicTheme.of(context).setBrightness(
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark);
            print(Theme.of(context).brightness);
          },
        ),
      ],
      title: Text(
        'applicationName'.tr,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
        ),
      ),
    );
  }
}

// var screenSize = MediaQuery.of(context).size;
// return Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     NavBarSizedBox(10),
//     Text(
//       'applicationName'.tr,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: Theme.of(context).accentColor,
//         fontSize: 20,
//         fontFamily: 'Montserrat',
//         fontWeight: FontWeight.w400,
//         letterSpacing: 3,
//       ),
//     ),
//     // NavBarSizedBox(5),
//     IconButton(
//       color: Theme.of(context).accentColor,
//       icon: Icon(
//         Icons.brightness_6,
//       ),
//       focusColor: Colors.red,
//       highlightColor: Colors.red,
//       onPressed: () {
//         DynamicTheme.of(context).setBrightness(
//             Theme.of(context).brightness == Brightness.dark
//                 ? Brightness.light
//                 : Brightness.dark);
//         print(Theme.of(context).brightness);
//       },
//     ),
//   ],
// );
