import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:rafiq/localization/app_localizations.dart';
// import 'package:rafiq/localization/cubit/locale_cubit.dart';
import 'package:rafiq/widgets/intro.dart';
import 'package:rafiq/screens/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesWithCache prefs =
      await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions());

  await init();
  Map<String, CountryWithPhoneCode> supportedRegions =
      await getAllSupportedRegions();

  ColorScheme colorScheme = const ColorScheme.light(
      primary: Color(0xff071952),
      onPrimary: Colors.white,
      secondary: Color(0xff088395));
  InputDecorationTheme decorationTheme = InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: colorScheme.secondary),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: colorScheme.secondary)));
  ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      inputDecorationTheme: decorationTheme,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: colorScheme.secondary),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))));

  var app = ConfigProvider(
      prefs: prefs,
      supportedRegions: supportedRegions,
      child: MaterialApp(
          home: const RafiqApp(),
          theme: theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales));
  runApp(app);
}

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

class RafiqApp extends StatelessWidget {
  const RafiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigProvider config = ConfigProvider.of(context);
    String? sessionToken = config.prefs.getString('sessionToken');
    bool ignoreIntro = config.prefs.getBool('ignoreIntro') ?? false;
    if (sessionToken != null) {}

    if (ignoreIntro) {
      return const GetStarted();
    }

    return Intro(infos: [
      IntroScreen(
        image: 'images/intros/1.svg.vec',
        title: 'Choose your courses easily',
        subtitle: 'Choose your courses easily and add it to favorite',
        nextButton: 'Next',
      ),
      IntroScreen(
        image: 'images/intros/2.svg.vec',
        title: 'Book your courses at any time',
        subtitle: 'Choose your courses easily and add it to favorite',
        nextButton: 'Next',
      ),
      IntroScreen(
        image: 'images/intros/3.svg.vec',
        title: 'Learn easily and anytime!',
        subtitle:
            'With video lessons, interactive tests, and certified certificates.',
        nextButton: 'Get Started',
      ),
    ], child: const GetStarted());
  }
}
