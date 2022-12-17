import 'package:flutter/cupertino.dart';
import 'package:localization_app/localization/app_localization.dart';

class AppDelgate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale: locale);
    await appLocalization.loadStrings();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
