// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:websitegyd/view/home.dart';
// import 'dart:html' as html;

// class LayoutTemplate extends StatefulWidget {
//   final Widget child;
//   const LayoutTemplate({Key key, this.child}) : super(key: key);
//   @override
//   _LayoutTemplateState createState() => _LayoutTemplateState();
// }

// class _LayoutTemplateState extends State<LayoutTemplate> {
//   // final GlobalKey scaffoldLayoutTempKey = new GlobalKey();
//   List<String> pageHistory = [];
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final SharedPreferences prefs = await _prefs;
//         prefs.setInt('control', 2);
//         print('Buraya Geldim');
//         if (prefs.getStringList('pageHistory').length > 0) {
//           pageHistory = prefs.getStringList('pageHistory');
//           if (pageHistory.isNotEmpty) {
//             pageHistory.removeLast();
//             print(prefs.getStringList('pageHistory'));
//             if (pageHistory.length > 0) {
//               String a = pageHistory.elementAt(pageHistory.length - 1);
//               print('A' + a);
//               prefs.setStringList("pageHistory", pageHistory).then(
//                     (bool success) {},
//                   );
//               print('Burada' + prefs.getStringList('pageHistory').toString());
//               return Get.toNamed(a);
//             }
//           } else {
//             print('Null');
//           }
//         } else {
//           print('Null 2');
//         }
//         return false;
//       },
//       child: Scaffold(
//         body: widget.child == null ? widget.child : Listener(),
//       ),
//     );
//   }
// }

// class Listeneawdawdr extends StatelessWidget {
//   const Listeneawdawdr({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CountdownTimer(

//     );
//   }
// }
