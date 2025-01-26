import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rafiq/screens/home_screen.dart';
import 'package:rafiq/screens/get_started.dart';
import 'package:rafiq/widgets/intro.dart';
import 'package:rafiq/screens/splash.dart';
import 'package:rafiq/localization.dart';
// import 'package:rafiq/config.dart';
import 'package:rafiq/utils.dart';
// import 'package:rafiq/response.dart';
// import 'package:rafiq/http_client.dart';
import 'package:rafiq/user.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  final supportedRegions = await getAllSupportedRegions();
  final localeProvider = await LocaleProvider.create();

  var app = MultiProvider(providers: [
    ChangeNotifierProvider.value(value: localeProvider),
    Provider<Dio>(create: (_) => Dio()..options.baseUrl = "http://192.168.1.2:8080"..options.validateStatus = (status) => status! < 500),
    Provider<Map<String, CountryWithPhoneCode>>.value(value: supportedRegions),
    Provider<UserRepository>(
        create: (context) => UserRepository(client: context.read<Dio>())),
  ], child: const RafiqApp());
  runApp(app);
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void initState() {
    super.initState();
    startScreen().then((next) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => next));
    });
  }

  Widget defaultIntro() {
    return const Intro(infos: [
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

  Future<Widget> startScreen() async {
    final prefs = SharedPreferencesAsync();
    final ignoreIntro = await prefs.getBool('ignoreIntro') ?? false;
    if (!ignoreIntro) {
      return defaultIntro();
    }
    final sessionToken = await prefs.getString('sessionToken');
    if (sessionToken != null) {
      try {
        final user = await context.read<UserRepository>().setToken(sessionToken);
        return const HomeScreen();
      } catch (e) {
        print(e);
      }
    }
    return const GetStarted();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class RafiqApp extends StatelessWidget {
  const RafiqApp({super.key});

  ThemeData theme() {
    final colorScheme = const ColorScheme.light(
        primary: Color(0xff071952),
        onPrimary: Colors.white,
        secondary: Color(0xff088395));

    final decorationTheme = InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: colorScheme.secondary),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: colorScheme.secondary)));

    final theme = ThemeData(
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: Builder(
        //     builder: (context) => SplashScreen(next: () async {
        //           final next = await startScreen(context);
        //           Navigator.pushReplacement(
        //               context, MaterialPageRoute(builder: (_) => next));
        //         })),
        home: const SplashScreen(next: StartScreen()),
        locale: context.watch<LocaleProvider>().locale,
        theme: theme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
