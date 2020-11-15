import 'package:flutter/material.dart';

import 'package:websitegyd/constants/strings.dart';
import 'package:get/get.dart';
import 'package:websitegyd/view/about_us.dart';
import 'package:websitegyd/view/contact_us.dart';
import 'package:websitegyd/view/home.dart';
import 'package:websitegyd/widgets/navbar_item/language_dropdown_menu.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_item.dart';
import '../navbar_item/nav_bar_sizedbox.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MobileDrawerState createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(UniversalStrings.mobilePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LanguageDropDownMenu(),
              NavBarSizedBox(20),
              NavBarSizedBox(20),
              // NavBarItem('home_page'.tr, Icons.home, HomePageRoute),
              NavBarItem(
                  'home_page'.tr, null, HomePage(), HomePage.route(), '/home'),
              buildMobileDrawerDiveder(context),
              // NavBarItem('contact_us'.tr, Icons.contact_page, ContactPageRoute),
              NavBarItem('contact_us'.tr, null, ContactUs(), ContactUs.route(),
                  '/contact'),
              NavBarItem(
                  'about_us'.tr, null, AboutUs(), AboutUs.route(), '/about'),
              // NavBarItem('about_us'.tr, Icons.ac_unit, AboutPageRoute),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: NavBarItem('copyright'.tr, Icons.copyright, HomePage(),
                      HomePage.route(), '/home'),
                  // NavBarItem('copyright'.tr, Icons.copyright, AboutPageRoute),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildMobileDrawerDiveder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: UniversalStrings.mobilePadding2,
          bottom: UniversalStrings.mobilePadding2),
      child: Divider(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.red,
        thickness: 2,
      ),
    );
  }
}

// Expanded buildBottomDesc(BuildContext context, String text) {
//   return Expanded(
//     child: Align(
//       alignment: Alignment.bottomCenter,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Theme.of(context).accentColor,
//           fontSize: 14,
//         ),
//       ),
//     ),
//   );
// }

// Container buildFlatButton(BuildContext context, String text) {
//   return Container(
//     width: double.maxFinite,
//     child: FlatButton(
//       color: Theme.of(context).accentColor,
//       highlightColor: Colors.red,
//       onPressed: () {},
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(
//           top: UniversalStrings.mobilePadding,
//           bottom: UniversalStrings.mobilePadding,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 20,
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? Colors.black
//                 : Colors.white,
//           ),
//         ),
//       ),
//     ),
//   );
// }
