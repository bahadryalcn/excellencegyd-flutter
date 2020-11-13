// import 'dart:async';

// import 'package:dynamic_theme/dynamic_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:websitegyd/constants/strings.dart';
// import 'package:websitegyd/router/route_names.dart';
// import 'package:websitegyd/widgets/languages_item.dart';
// import 'package:websitegyd/services/localization_services.dart';

// class NavigationDesktopBar extends StatefulWidget {
//   static LanguageItemWidget dropdownValue;

//   static BuildContext context2;

//   @override
//   _NavigationDesktopBarState createState() => _NavigationDesktopBarState();
// }

// class _NavigationDesktopBarState extends State<NavigationDesktopBar> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   Widget build(BuildContext context) {
//     final _screenSize = MediaQuery.of(context).size;
//     NavigationDesktopBar.context2 = context;
//     return Container(
//       color: Theme.of(context).bottomAppBarColor,
//       child: Padding(
//         padding: EdgeInsets.all(UniversalStrings.desktopPadding),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'applicationName'.tr,
//               style: TextStyle(
//                 color: Theme.of(context).accentColor,
//                 fontSize: 20,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w400,
//                 letterSpacing: 3,
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   buildSizedBoxDivider(8, _screenSize),
//                   NavBarItem(
//                     'home_page'.tr,
//                     null,
//                     HomePageRoute,
//                   ),
//                   // buildInkWell(context, 'home_page'.tr, 0),
//                   buildSizedBoxDivider(20, _screenSize),
//                   NavBarItem('contact_us'.tr, null, ContactPageRoute),
//                   buildSizedBoxDivider(20, _screenSize),
//                   NavBarItem('about_us'.tr, null, AboutPageRoute),
//                   // buildInkWell(context, 'contact_us'.tr, 1),
//                 ],
//               ),
//             ),
//             buildChangeThemeIcon(context),
//             buildSizedBoxDivider(50, _screenSize),
//             NavBarItem('sign_in_button'.tr, null, HomePageRoute),
//             // buildInkWell(context, 'sign_in_button'.tr, 3),
//             buildSizedBoxDivider(50, _screenSize),
//             buildLanguageDropDownMenu(_screenSize),
//           ],
//         ),
//       ),
//     );
//   }

//   SizedBox buildSizedBoxDivider(int value, Size screenSize) {
//     return SizedBox(
//       width: screenSize.width / value,
//     );
//   }

//   DropdownButton<LanguagesItem> buildLanguageDropDownMenu(Size screenSize) {
//     var initialLanguage =
//         LocalizationService().getLanguageFromLocale(Get.locale.toString());

//     return DropdownButton(
//       icon: Icon(Icons.arrow_downward),
//       iconEnabledColor: Theme.of(NavigationDesktopBar.context2).accentColor,
//       hint: initialLanguage.buildLanguageItem(NavigationDesktopBar.context2),
//       dropdownColor: Theme.of(NavigationDesktopBar.context2).hoverColor,
//       value: NavigationDesktopBar.dropdownValue,
//       items: UniversalStrings.languageItems
//           .map<DropdownMenuItem<LanguagesItem>>((value) {
//         return DropdownMenuItem<LanguagesItem>(
//           value: value,
//           child: value.buildLanguageItem(NavigationDesktopBar.context2),
//         );
//       }).toList(),
//       onTap: () {},
//       onChanged: (newvalue) {
//         try {
//           NavigationDesktopBar.dropdownValue = newvalue;
//           _bids(NavigationDesktopBar.context2, screenSize);
//         } catch (ee) {
//           print(ee.toString());
//         }
//       },
//     );
//   }

//   void _bids(BuildContext context, Size screenSize) async {
//     await Future<void>.delayed(Duration(milliseconds: 500));
//     if (LocalizationService()
//         .changeLocale(NavigationDesktopBar.dropdownValue.name)) {
//       LocalizationService()
//           .changeLocale(NavigationDesktopBar.dropdownValue.name);
//       setInitialPreferences();
//       showDialog(
//         context: context,
//         builder: (context) {
//           return dialogWidget(context, screenSize);
//         },
//       );
//       Timer(Duration(milliseconds: 1200), () {
//         if (Navigator.canPop(context)) {
//           Navigator.of(context).pop();
//         }
//       });
//     }
//   }

//   Future<void> setInitialPreferences() async {
//     final SharedPreferences prefs = await _prefs;
//     prefs.setString("applicationLang", Get.locale.toString()).then(
//           (bool success) {},
//         );
//   }

//   Dialog dialogWidget(BuildContext context, Size screenSize) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(UniversalStrings.desktopPadding),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: Container(
//         alignment: Alignment.center,
//         height: screenSize.height * 0.2,
//         width: screenSize.width * 0.3,
//         decoration: BoxDecoration(
//           color: Theme.of(context).accentColor,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.check_circle_outline,
//               color: Colors.green,
//               size: 60,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: UniversalStrings.desktopPadding,
//                   bottom: UniversalStrings.desktopPadding),
//               child: Text(
//                 'language_changed'.tr,
//                 style: TextStyle(color: Theme.of(context).canvasColor),
//               ),
//             ),
//             RaisedButton(
//               color: Theme.of(context).canvasColor,
//               onPressed: () {
//                 if (Navigator.canPop(context)) {
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text(
//                 'okey'.tr,
//                 style: TextStyle(color: Theme.of(context).accentColor),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconButton buildChangeThemeIcon(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.brightness_6),
//       splashColor: Colors.red,
//       splashRadius: 1000,
//       color: Theme.of(context).accentColor,
//       onPressed: () {
//         DynamicTheme.of(context).setBrightness(
//             Theme.of(context).brightness == Brightness.dark
//                 ? Brightness.light
//                 : Brightness.dark);
//       },
//     );
//   }
// }
