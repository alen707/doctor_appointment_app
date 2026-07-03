import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {

  static Future<void> saveLanguage(String languageCode) async {

    print("save");
    print("save");
    print("save");
    print("save");
    print("save");

    print(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    

  }

  static Future<String> getLanguage() async {

    print("get langage");
    print("get langage");
    print("get langage");
    print("get langage");
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('language') ?? 'en');
    print("beeeeeeeeee");
    print("beeeeeeeeee");
    print("beeeeeeeeee");
    return prefs.getString('language') ?? 'en';
  }

}