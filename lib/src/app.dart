import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:srp_parent_mobile/src/core/localization/app_localization.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/loading.screen.dart';
import 'package:srp_parent_mobile/src/core/route/route.dart';
import 'package:srp_parent_mobile/src/core/theme/dark_theme.data.dart';
import 'package:srp_parent_mobile/src/core/theme/light_theme.data.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/screens/authentication.screen.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/screens/splash.screen.dart';

class SRPApp extends StatefulWidget {
  const SRPApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _SRPAppState state = context.findAncestorStateOfType<_SRPAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _SRPAppState createState() => _SRPAppState();
}

class _SRPAppState extends State<SRPApp> {
  Locale _locale = Locale.fromSubtags(languageCode: 'en');

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return MaterialApp(home: LoadingScreen());
    } else {
      return MaterialApp(
        title: 'SRP Parent App',
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("fa", "IR"),
          Locale("ar", "SA"),
          Locale("hi", "IN")
        ],
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: LightTheme.getTheme,
        darkTheme: DarkTheme.getTheme,
        themeMode: ThemeMode.system,
        home: LoginScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    }
  }
}
