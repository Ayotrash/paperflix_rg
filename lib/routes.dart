import 'package:flutter/material.dart';
import 'package:paperflix_rg/screens/authentication/authentication.dart';
import 'package:paperflix_rg/screens/choose_gender/choose_gender.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:paperflix_rg/screens/register/register.dart';

final Map<String, WidgetBuilder> routes = {
  '/Home': (BuildContext context) => Home(),
  '/Auth': (BuildContext context) => Authentication(),
  '/ChooseGender': (BuildContext context) => ChooseGender(),
  '/Register': (BuildContext context) => Register(),
};
