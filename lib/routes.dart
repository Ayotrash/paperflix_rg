import 'package:flutter/material.dart';
import 'package:paperflix_rg/screens/authentication/authentication.dart';
import 'package:paperflix_rg/screens/choose_gender/choose_gender.dart';
import 'package:paperflix_rg/screens/choose_template/choose_template.dart';
import 'package:paperflix_rg/screens/custom_template/custom_template.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:paperflix_rg/screens/premium/premium.dart';
import 'package:paperflix_rg/screens/profile/profile.dart';
import 'package:paperflix_rg/screens/register/register.dart';
import 'package:paperflix_rg/screens/new_resume/new_resume.dart';

final Map<String, WidgetBuilder> routes = {
  '/Home': (BuildContext context) => Home(),
  '/Auth': (BuildContext context) => Authentication(),
  '/ChooseGender': (BuildContext context) => ChooseGender(),
  '/ChooseTemplate': (BuildContext context) => ChooseTemplate(),
  '/CustomTemplate': (BuildContext context) => CustomTemplate(),
  '/Register': (BuildContext context) => Register(),
  '/Premium': (BuildContext context) => Premium(),
  '/NewResume': (BuildContext context) => NewResume(),
  '/Profile': (BuildContext context) => Profile(),
};
