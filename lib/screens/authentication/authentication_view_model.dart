import 'package:flutter/material.dart';
import './authentication.dart';

abstract class AuthenticationViewModel extends State<Authentication> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;

  void loginMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
