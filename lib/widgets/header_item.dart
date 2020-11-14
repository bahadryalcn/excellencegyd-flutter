import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:websitegyd/constants/strings.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        child: SizedBox(
          height: screenSize.height * 0.45,
          width: screenSize.width,
          child: Image.asset(
            UniversalStrings.mainImagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.colorDodge,
          color: Colors.black.withOpacity(0.3),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 20.0, height: screenSize.height * 0.45),
            RotateAnimatedTextKit(
              onTap: () {
                // print("Tap Event");
              },
              text: ["SEE", "FEEL", "LIVE"],
              textStyle: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontFamily: "Montserrat"),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20.0,
              height: screenSize.height * 0.45,
            ),
            Text(
              " Turkey",
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            ),
          ],
        ),
      ),
    ]);
  }
}
