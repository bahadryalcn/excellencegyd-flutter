import 'package:flutter/material.dart';
import 'package:websitegyd/widgets/languages_item.dart';

class UniversalStrings {
  UniversalStrings._();
  static const double mobilePadding = 16;
  static const double mobilePadding2 = 6;
  static const double desktopPadding = 20;
  static const double desktopPadding2 = 10;
  static const double avatarRadius = 45;

  //Localizations Variables
  static final List<LanguagesItem> languageItems = [
    LanguageItemWidget('Türkçe', 'assets/images/flags/tr.png'),
    LanguageItemWidget('中文', 'assets/images/flags/cn.png'),
    LanguageItemWidget('English', 'assets/images/flags/en.png'),
    LanguageItemWidget('Deutsche', 'assets/images/flags/de.png'),
    LanguageItemWidget('Français', 'assets/images/flags/fr.png'),
    LanguageItemWidget('Italiano', 'assets/images/flags/it.png'),
    LanguageItemWidget('عربى', 'assets/images/flags/ar.png'),
    LanguageItemWidget('日本人', 'assets/images/flags/ja.png'),
  ];

  //Main Image Path
  static const String mainImagePath = 'assets/images/istanbul.jpg';

//Floating Quick Access Widget Variables
  static List isHoveringFloatingQuickAccess = [false, false, false, false];
  static const List<String> itemsFloatingQuickAccess = [
    'Bahadır',
    'Halil',
    'Yalçın',
    'Excellence GYD'
  ];

  static const List<IconData> iconsFloatingQuickAccess = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];
//-------------------------------------------------

//Featured Heading Widget Variables
  static const String titleFeaturedHeading = "Excellence GYD TEST";
  static const String subtitleFeaturedHeading = "Test TEST";
//-------------------------------------------------

//Features Tiles variables
  static const List<String> assetsFeaturesTiles = [
    'assets/images/main_home1.jpg',
    'assets/images/main_home2.jpg',
    'assets/images/main_home3.jpg',
  ];
  // Title Features Tiles
  static const List<String> titleFeaturesTiles = [
    'Home 1',
    'Home 2',
    'Home 2',
  ];
  //-------------------------------------------------

  //Title of Destination Heading Widget variables
  static const String titleDestinationHeading = "Projects";
  //-------------------------------

  // Carousel Variables

  static const String imagePath = 'assets/images/';
  static List isHoveringCarousel = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  static List isSelectedCarousel = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  static const List<String> imagesCarousel = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  static const List<String> placesCarousel = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];
  //---------------------------------------------

}
