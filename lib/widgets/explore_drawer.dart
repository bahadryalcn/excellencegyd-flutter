import 'dart:async';

import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';
import 'package:websitegyd/models/languages_item.dart';
import 'package:get/get.dart';
import 'package:websitegyd/services/localization_services.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  static LanguageItemWidget dropdownValue;
  var _screenSize;

  int dialogActive = 0;
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildLanguageDropDownMenu(context),
              SizedBox(height: 20),
              SizedBox(height: 20),
              buildInkWell(context, 'home_page'.tr),
              buildMobileDrawerDiveder(context),
              buildInkWell(context, 'contact_us'.tr),
              buildBottomDesc(context, 'copyright'.tr),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<LanguagesItem> buildLanguageDropDownMenu(
      BuildContext context) {
    var initialLanguage =
        LocalizationService().getLanguageFromLocale(Get.locale.toString());

    return DropdownButton(
      hint: initialLanguage.buildLanguageItem(context),
      dropdownColor: Theme.of(context).hoverColor,
      value: dropdownValue,
      items: UniversalStrings.languageItems
          .map<DropdownMenuItem<LanguagesItem>>((value) {
        return DropdownMenuItem<LanguagesItem>(
          value: value,
          child: value.buildLanguageItem(context),
        );
      }).toList(),
      onTap: () {},
      onChanged: (newvalue) {
        try {
          dropdownValue = newvalue;
          _bids();
        } catch (ee) {
          print(ee.toString());
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _bids() async {
    await Future<void>.delayed(Duration(milliseconds: 500));

    if (LocalizationService().changeLocale(dropdownValue.name)) {
      LocalizationService().changeLocale(dropdownValue.name);
      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return dialogWidget();
          },
        );
        Timer(Duration(milliseconds: 1200), () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        });
      });
    }
  }

  Dialog dialogWidget() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UniversalStrings.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: _screenSize.height * 0.2,
        width: _screenSize.width * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                'language_changed'.tr,
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ),
            RaisedButton(
              color: Theme.of(context).canvasColor,
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'okey'.tr,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Expanded buildBottomDesc(BuildContext context, String text) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Container buildFlatButton(BuildContext context, String text) {
    return Container(
      width: double.maxFinite,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        highlightColor: Colors.red,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildMobileDrawerDiveder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Divider(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.red,
        thickness: 2,
      ),
    );
  }

  InkWell buildInkWell(BuildContext context, String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 22,
        ),
      ),
    );
  }
}

// DropdownButton<LanguagesItem> buildLanguageDropDownMenu(
//     BuildContext context) {
//   var initialLanguage =
//       LocalizationService().getLanguageFromLocale(Get.locale.toString());
//   return DropdownButton(
//     hint: initialLanguage.buildLanguageItem(context),
//     dropdownColor: Theme.of(context).hoverColor,
//     value: dropdownValue,
//     items: UniversalStrings.languageItems
//         .map<DropdownMenuItem<LanguagesItem>>((value) {
//       return DropdownMenuItem<LanguagesItem>(
//         value: value,
//         child: value.buildLanguageItem(context),
//       );
//     }).toList(),
//     onTap: () {},
//     onChanged: (newvalue) {
//       try {
//         dropdownValue = newvalue;
//         var myWidget = StreamBuilder(
//           stream: _bids,
//           builder: (
//             BuildContext context,
//             AsyncSnapshot<int> snapshot,
//           ) {
//             List<Widget> children2;
//             if (snapshot.hasError) {
//               children2 = <Widget>[
//                 Icon(
//                   Icons.error_outline,
//                   color: Colors.red,
//                   size: 60,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16),
//                   child: Text('Error: ${snapshot.error}'),
//                 )
//               ];
//             } else {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   children2 = <Widget>[
//                     Icon(
//                       Icons.info,
//                       color: Colors.blue,
//                       size: 60,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text('Select a lot'),
//                     )
//                   ];
//                   break;
//                 case ConnectionState.waiting:
//                   children2 = <Widget>[
//                     SizedBox(
//                       child: const CircularProgressIndicator(),
//                       width: 60,
//                       height: 60,
//                     ),
//                   ];
//                   break;
//                 case ConnectionState.active:
//                   children2 = [
//                     SizedBox(
//                       child: const CircularProgressIndicator(),
//                       width: 60,
//                       height: 60,
//                     ),
//                   ];
//                   break;
//                 case ConnectionState.done:
//                   children2 = <Widget>[
//                     CustomDialogBox(
//                       child: Column(
//                         children: [
//                           Icon(
//                             snapshot.data == 1
//                                 ? Icons.check_circle_outline
//                                 : Icons.error,
//                             color: snapshot.data == 1
//                                 ? Colors.green
//                                 : Colors.red,
//                             size: 60,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 16),
//                             child: snapshot.data == 1
//                                 ? Text('language_changed'.tr)
//                                 : Text('error_occured_changing_language'.tr),
//                           )
//                         ],
//                       ),
//                     ),
//                   ];
//                   break;
//               }
//             }
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: children2,
//             );
//           },
//         );
//         // });
//         showDialog(
//           context: context,
//           builder: (context) => myWidget,
//         );

//         // print(newvalue.aa());
//       } catch (ee) {
//         print(ee.toString());
//       }
//     },
//   );
// }
