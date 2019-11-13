import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/localization/app_translations_delegate.dart';
import 'package:paperflix_rg/localization/application.dart';
import 'package:paperflix_rg/routes.dart';
import 'package:paperflix_rg/screens/authentication/authentication.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:paperflix_rg/widgets/without_resume_banner.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isLogin = false;
  bool isFillResume = true;

  Future<void> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLogin = prefs.getBool('isLogin') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getLogin();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    storage.ready.then((_) {
      Map _userProfile = Map();
      _userProfile = storage.getItem('userProfile') ?? Map();
      print(_userProfile);
      if (_userProfile != {}) {
        if (_userProfile['place_of_birth'].length <= 0 ||
            _userProfile['phone'].length <= 0 ||
            _userProfile['job_title'].length <= 0 ||
            _userProfile['country'].length <= 0 ||
            _userProfile['province'].length <= 0 ||
            _userProfile['address'].length <= 0 ||
            _userProfile['city'].length <= 0 ||
            _userProfile['about_you'].length <= 0 ||
            _userProfile['employment'].length <= 0 ||
            _userProfile['education'].length <= 0 ||
            _userProfile['skills'].length <= 0) {
          print("Not Go Home");
          setState(() {
            isFillResume = false;
          });
          print(isFillResume);
        } else {
          print("Go Home");
          setState(() {
            isFillResume = true;
          });
          print(isFillResume);
        }
      }
    });
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
      home: !isLogin
          ? Authentication()
          : isLogin && !isFillResume ? WithoutResumeBanner() : Home(),
      routes: routes,
    );
  }
}

//How to Use Language:
//e.g. ${AppTranslations.of(context).text("title_home")}
