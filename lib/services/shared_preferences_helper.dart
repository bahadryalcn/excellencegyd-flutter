// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:websitegyd/view/home.dart';

// class SharedPreferencesHelper {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   String applicationTheme;
//   String applicationLang;

//   void initializeVars(BuildContext context) {
//     applicationLang = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getString('applicationLang') ?? 'en_US');
//     }).toString();
//     applicationTheme = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getString('applicationTheme') ??
//           Theme.of(context).brightness.toString());
//     }).toString();
//   }

//   Future<String> getApplicationLanguage() {
//     return _prefs.then((SharedPreferences prefs) {
//       return (prefs.getString('applicationLang') ?? 'en_US');
//     });
//     // return (_prefs.then((value) => null).getString('applicationLang') ?? 'en_US');
//   }

//   Future<void> setInitialPreferences() async {
//     final SharedPreferences prefs = await _prefs;
//     String aa = prefs.getString('applicationLang') ?? 'en_US';
//     print(aa);
//     prefs
//         .setString("applicationLang", Get.locale.toString())
//         .then((bool success) {
//       return applicationLang;
//     });
//   }
// }
