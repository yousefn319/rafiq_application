import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends InheritedWidget {
  const ConfigProvider({
    super.key,
    required this.prefs,
    required this.supportedRegions,
    required super.child,
  });

  final SharedPreferencesWithCache prefs;
  final Map<String, CountryWithPhoneCode> supportedRegions;

  static ConfigProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConfigProvider>();
  }

  static ConfigProvider of(BuildContext context) {
    final ConfigProvider? result = maybeOf(context);
    assert(result != null, 'No ConfigProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
