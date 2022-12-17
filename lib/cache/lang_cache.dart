import 'package:shared_preferences/shared_preferences.dart';

class LangCacheHelper{
  Future<void>setLang(String languageCode)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString('LOCALE', languageCode);
  }
  Future<String> getLang()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
   String? savedLang= preferences.getString('LOCALE');
   if(savedLang!=null){
    return savedLang;
   }return 'en';
  }
}