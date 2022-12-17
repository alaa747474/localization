import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:localization_app/cache/lang_cache.dart';

part 'app_lang_state.dart';

class AppLangCubit extends Cubit<AppLangState> {
  AppLangCubit() : super(AppLangInitial());
  LangCacheHelper langCacheHelper = LangCacheHelper();
  Future<void> setLang(String languageCode) async {
    await langCacheHelper.setLang(languageCode);
    emit(LangState(locale: Locale(languageCode)));
  }

  Future savedLang() async {
    String savedLang = await langCacheHelper.getLang();
    emit(LangState(locale: Locale(savedLang)));
  }
}
