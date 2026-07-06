import 'package:shared_preferences/shared_preferences.dart';

class SkippageSharedprefarance {

  static Future<void> saveStatus(bool languageCode) async {

   
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstime', languageCode);
    

  }

  static Future<bool> getStatus() async {

    
    final prefs = await SharedPreferences.getInstance();
   
    
    return prefs.getBool('firstime') ?? true;
  }

}