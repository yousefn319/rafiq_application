import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rafiq_application/features/localization/app_localizations.dart';
import 'package:rafiq_application/features/localization/cubit/locale_cubit.dart';
import 'package:rafiq_application/widgets/intro.dart';
import 'package:rafiq_application/features/introscreens/presentation/get_started.dart';
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

  //ThemeData theme = Themedata();
  ThemeData theme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff088395),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: const Color(0xff071952))),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Color(0xff088395)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0xff071952))),
          focusedBorder: OutlineInputBorder(
              gapPadding: BorderSide.strokeAlignCenter,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0xff088395)))));

  var app = MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: ConfigProvider(
          prefs: prefs,
          supportedRegions: supportedRegions,
          child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
            return MaterialApp(
              home: const RafiqApp(),
              theme: theme,
              locale: state.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }

                return supportedLocales.first;
              },
            );
          })));
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
      return GetStarted();
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
    ], child: GetStarted());
  }
}
