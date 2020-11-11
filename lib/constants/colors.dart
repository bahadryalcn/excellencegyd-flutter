import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UniversalVariables {
  //DARK MODE
  static final Color darkAppBarBackgroundColor = HexColor('#050505');
  static final Color darkbackgroundColor = HexColor('#000000');
  static final Color darkcardcolor = HexColor('#211e1e');
  static final Color darkbuttonPrimaryColor = HexColor('#080505');
  static final Color darkbuttonDecorationColor = HexColor('#51b2bd');
  static final Color darkbottomAppBarColor = HexColor('#171717');
  static final Color darksubtitle1 = HexColor('#51b2bd');
  static final Color darkscrollViewColor = HexColor('#51b2bd');

  static final Color lightAppBarBackgroundColor = HexColor('#050505');
  static final Color lightbackgroundColor = HexColor('#000000');
  static final Color lightcardcolor = HexColor('#211e1e');
  static final Color lightbuttonPrimaryColor = HexColor('#080505');
  static final Color lightbuttonDecorationColor = HexColor('#51b2bd');
  static final Color lightbottomAppBarColor = HexColor('#171717');
  static final Color lightsubtitle1 = HexColor('#51b2bd');
  static final Color lightscrollViewColor = HexColor('#51b2bd');

  // static final Color blackColor = Color(0xff000000);
  // static final Color whiteColor = Color(0x00fffff);
  // static final Color greyColor = Color(0xffa2a2a2);
  // static final Color userCircleBackground = Color(0xff2b2b33);
  // static final Color onlineDotColor = Color(0xff46dc64);
  // static final Color lightBlueColor = Color(0xff0077d7);
  // static final Color separatorColor = Color(0xffffffff);

  // static final Color gradientColorStart = Color(0xffff0012);
  // static final Color gradientColorEnd = Color(0xffff3600);

  // static final Color senderColor = Color(0xffff3434);
  // static final Color receiverColor = Color(0xffff1800);

  static final Gradient fabGradient = LinearGradient(
      colors: [Colors.red, Colors.pink],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static final Gradient backGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.red, Colors.pink[800]],
  );
}
