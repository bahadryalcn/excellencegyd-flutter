import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:websitegyd/localization/ar_arabic.dart';
import 'package:websitegyd/localization/cn_china.dart';
import 'package:websitegyd/localization/de_german.dart';
import 'package:websitegyd/localization/en_english.dart';
import 'package:websitegyd/localization/fr_french.dart';
import 'package:websitegyd/localization/it_italian.dart';
import 'package:websitegyd/localization/ja_japanese.dart';
import 'package:websitegyd/localization/tr_turkish.dart';
import 'package:websitegyd/widgets/languages_item.dart';

class LocalizationService extends Translations {
  static var locale = Locale('en', 'US');
  static Future<String> applicationLang;
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'Türkçe',
    '中文',
    'English',
    'Deutsche',
    'Français',
    'Italiano',
    'عربى',
    '日本人',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('tr', 'TR'),
    Locale('cn', 'CN'),
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('fr', 'FR'),
    Locale('it', 'IT'),
    Locale('ar', 'AR'),
    Locale('ja', 'JA'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'tr_TR': trTR, // lang/tr_tr.dart
        'cn_CN': cnCN, // lang/ja_jp.dart
        'de_DE': deDE, // lang/ja_jp.dart
        'fr_FR': frFR, // lang/ja_jp.dart
        'it_IT': itIT, // lang/ja_jp.dart
        'ar_AR': arAR, // lang/ja_jp.dart
        'ja_JA': jaJA, // lang/ja_jp.dart
      };

  // Gets locale from language, and updates the locale
  bool changeLocale(String lang) {
    try {
      var newlocale = _getLocaleFromLanguage(lang);
      locale = newlocale;
      Get.updateLocale(newlocale);
      return true;
    } catch (ee) {
      print('Error: Language did not added yet');
      return false;
    }
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }

  LanguageItemWidget getLanguageFromLocale(String code) {
    for (int i = 0; i < langs.length; i++) {
      if (code == locales[i].toString()) {
        final localLanguageItem = LanguageItemWidget(langs[i].toString(),
            'assets/images/flags/${Get.locale.languageCode}.png');
        return localLanguageItem;
      }
    }
    return null;
  }

  Locale getLocalLanguage(String localLang) {
    for (int i = 0; i < langs.length; i++) {
      if (localLang == locales[i].toString()) {
        Get.updateLocale(locales[i]);
        return locales[i];
      }
    }
    return locales[2];
  }
}
