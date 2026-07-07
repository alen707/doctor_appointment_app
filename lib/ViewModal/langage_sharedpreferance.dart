import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('language') ?? 'en';
  }
}
