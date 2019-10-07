import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paperflix_rg/localization/app_translations_delegate.dart';
import 'package:paperflix_rg/localization/application.dart';
import 'package:paperflix_rg/routes.dart';
import 'package:paperflix_rg/screens/authentication/authentication.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  // Store<AppState> _store = await createStore();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    // getLocate();
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Paperflix Resume Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // platform: TargetPlatform.iOS,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Color(0xFF2F3542),
          ),
          primarySwatch: Colors.grey,
          primaryTextTheme:
              TextTheme(title: TextStyle(color: Color(0xFF2f3542)))),
      localizationsDelegates: [
        _newLocaleDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: <Locale>[
        const Locale('en', ''),
        const Locale('id', ''),
      ],
      home: Authentication(),
      routes: routes,
    );
  }
}
