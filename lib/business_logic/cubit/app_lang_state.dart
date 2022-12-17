part of 'app_lang_cubit.dart';

@immutable
abstract class AppLangState {}

class AppLangInitial extends AppLangState {}

class LangState extends AppLangState {
  final Locale locale;
  LangState({required this.locale});
}
