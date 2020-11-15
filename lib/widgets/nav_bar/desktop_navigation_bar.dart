import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:get/get.dart';
import 'package:websitegyd/view/about_us.dart';
import 'package:websitegyd/view/contact_us.dart';
import 'package:websitegyd/view/home.dart';
import 'package:websitegyd/widgets/navbar_item/change_theme.dart';
import 'package:websitegyd/widgets/navbar_item/language_dropdown_menu.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_item.dart';
import 'package:websitegyd/widgets/navbar_item/nav_bar_sizedbox.dart';

class DesktopNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Padding(
        padding: EdgeInsets.all(UniversalStrings.desktopPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'applicationName'.tr,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: 3,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavBarSizedBox(30),
                  NavBarItem('home_page'.tr, null, HomePage(),
                      HomePage.routeAnim(), '/home'),
                  // NavBarItem('home_page'.tr, null, HomePageRoute),
                  NavBarSizedBox(30),
                  NavBarItem('contact_us'.tr, null, ContactUs(),
                      ContactUs.routeAnim(), '/contact'),
                  // NavBarItem('contact_us'.tr, null, ContactPageRoute),
                  NavBarSizedBox(50),
                  NavBarItem('about_us'.tr, null, AboutUs(),
                      AboutUs.routeAnim(), '/about'),
                  // NavBarItem('about_us'.tr, null, AboutPageRoute),
                ],
              ),
            ),
            // NavBarSizedBox(screenSize.width / ),
            ChangeThemeButton(),
            NavBarSizedBox(50),
            NavBarItem('sign_in_button'.tr, null, HomePage(),
                HomePage.routeAnim(), '/home'),
            // NavBarItem('sign_in_button'.tr, null, HomePageRoute),
            NavBarSizedBox(50),
            LanguageDropDownMenu()
          ],
        ),
      ),
    );
  }
}
