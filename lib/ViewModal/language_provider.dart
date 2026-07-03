import 'package:flutter/material.dart';
import 'package:docter_appointment_app/ViewModal/langage_sheredpteference.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LanguageProvider() {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    String language = await LanguageService.getLanguage();
    _locale = Locale(language);
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageService.saveLanguage(languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }
}