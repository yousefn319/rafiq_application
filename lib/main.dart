import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rafiq/widgets/intro.dart';
import 'package:rafiq/screens/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesWithCache prefs =
      await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions());

  await init();
  Map<String, CountryWithPhoneCode> supportedRegions =
      await getAllSupportedRegions();

  bool languagePerApp = await Devicelocale.isLanguagePerAppSettingSupported;
  Locale? currentLocale = await Devicelocale.currentAsLocale;

  LocaleProvider Function(BuildContext)? localeProvider;
  if (languagePerApp) {
    localeProvider = (_) => SystemLocaleProvider();
  } else {
    localeProvider = (_) => AppLocaleProvider(currentLocale, prefs);
  }

  var app = MultiProvider(
      providers: [ChangeNotifierProvider(create: localeProvider!)],
      child: ConfigProvider(
          prefs: prefs,
          supportedRegions: supportedRegions,
          child: const RafiqApp()));
  runApp(app);
}

abstract class LocaleProvider extends ChangeNotifier {
  Locale? getLocale();
  void setLocale(Locale value);
}

class SystemLocaleProvider extends LocaleProvider {
  Locale? getLocale() => null;
  void setLocale(Locale value) {
    Devicelocale.setLanguagePerApp(value);
  }
}

class AppLocaleProvider extends LocaleProvider {
  AppLocaleProvider(this.locale, this.prefs);
  Locale? locale;
  SharedPreferencesWithCache prefs;

  Locale? getLocale() => this.locale;
  void setLocale(Locale value) {
    locale = value;
    // prefs.setString('locale', value.toString());
    notifyListeners();
  }
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

  ThemeData theme() {
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

    return theme;
  }

  Widget defaultIntro() {
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

  Widget startScreen(BuildContext context) {
    ConfigProvider config = ConfigProvider.of(context);
    String? sessionToken = config.prefs.getString('sessionToken');
    if (sessionToken != null) {
      return HomeScreen();
    }
    bool ignoreIntro = config.prefs.getBool('ignoreIntro') ?? false;
    if (ignoreIntro) {
      return GetStarted();
    }
    return defaultIntro();
  }

  @override
  Widget build(BuildContext context) {
    Widget start = startScreen(context);
    Locale? locale = context.watch<LocaleProvider>().getLocale();
    return MaterialApp(
        home: start,
        locale: locale,
        theme: theme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
