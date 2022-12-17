import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:localization_app/localization/app_delegate.dart';

class AppLocalization {
  static LocalizationsDelegate<AppLocalization> delgate = AppDelgate();
  final Locale locale;
  late Map<String, String> localizationString;
  AppLocalization({required this.locale});
  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Future loadStrings() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    localizationString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => localizationString[key] ?? '';
}
