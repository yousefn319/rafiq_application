import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleProvider extends ChangeNotifier {
  Locale? get locale;
  set locale(Locale? value);
}

class SystemLocaleProvider extends LocaleProvider {
  @override
  Locale? get locale => null;
  @override
  set locale(Locale? value) => Devicelocale.setLanguagePerApp(value!);
}

class AppLocaleProvider extends LocaleProvider {
  AppLocaleProvider(this._locale, this.prefs);
  Locale? _locale;
  SharedPreferencesWithCache prefs;

  @override
  Locale? get locale => _locale;
  @override
  set locale(Locale? value) {
    if (value != _locale) {
      _locale = value;
      prefs.setString('locale', value!.languageCode);
      notifyListeners();
    }
  }
}
