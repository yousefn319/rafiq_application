import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleProvider extends ChangeNotifier {
  Locale? get locale;
  set locale(Locale? value);
  static Future<LocaleProvider> create() async {
    bool languagePerApp = await Devicelocale.isLanguagePerAppSettingSupported;
    if (languagePerApp) {
      return SystemLocaleProvider();
    }
    Locale? currentLocale = await Devicelocale.currentAsLocale;
    final saved = await SharedPreferencesAsync().getString('locale');
    final locale = saved == null ? currentLocale : Locale(saved);
    return AppLocaleProvider(locale);
  }
}

class SystemLocaleProvider extends LocaleProvider {
  @override
  Locale? get locale => null;
  @override
  set locale(Locale? value) => Devicelocale.setLanguagePerApp(value!);
}

class AppLocaleProvider extends LocaleProvider {
  AppLocaleProvider(this._locale);
  Locale? _locale;

  @override
  Locale? get locale => _locale;
  @override
  set locale(Locale? value) {
    if (value != _locale) {
      _locale = value;
      SharedPreferencesAsync().setString('locale', value!.languageCode);
      notifyListeners();
    }
  }
}
