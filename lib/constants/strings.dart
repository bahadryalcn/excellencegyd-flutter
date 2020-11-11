import 'package:websitegyd/models/languages_item.dart';

class UniversalStrings {
  UniversalStrings._();
  static const double padding = 20;
  static const double avatarRadius = 45;
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
}
