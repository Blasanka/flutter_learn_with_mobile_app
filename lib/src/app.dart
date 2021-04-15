import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srp_parent_mobile/src/core/localization/app_localization.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/base.view.dart';
import 'package:srp_parent_mobile/src/core/presentation/screens/loading.screen.dart';
import 'package:srp_parent_mobile/src/core/provider/page_view.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/theme.provider.dart';
import 'package:srp_parent_mobile/src/core/route/route.dart';
import 'package:srp_parent_mobile/src/core/theme/dark_theme.data.dart';
import 'package:srp_parent_mobile/src/core/theme/light_theme.data.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/auth.provider.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/screens/authentication.screen.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/providers/calendar.provider.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/providers/calendar.provider.dart';
import 'package:srp_parent_mobile/src/feature/notices/presentation/providers/notices.provider.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/providers/student_list.provider.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

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
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<PageViewProvider>(create: (_) => PageViewProvider()),
          ChangeNotifierProvider<NoticesProvider>(create: (_) => NoticesProvider()),
          ChangeNotifierProvider<CalendarProvider>(create: (_) => CalendarProvider()),
          ChangeNotifierProvider<StudentProvider>(create: (_) => StudentProvider()),
          // ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider(cacheManager: sl())),
        ],
        child: BaseView<ThemeProvider>(
          onModelReady: (model) => model.themeMode,
          builder: (context, provider, child) =>
              Builder(builder: (BuildContext context) {
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
                  theme: LightTheme.getTheme.copyWith(
                    textTheme: GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme).copyWith(),
                  ),
                  darkTheme: DarkTheme.getTheme.copyWith(
                    textTheme: GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme).copyWith(),
                  ),
                  themeMode: provider.themeMode,
                  home:  LoginScreen(),
                  onGenerateRoute: AppRouter.onGenerateRoute,
                );
              },
              ),
        ),
      );
    }
  }
}
