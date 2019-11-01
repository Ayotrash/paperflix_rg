import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './authentication.dart';

abstract class AuthenticationViewModel extends State<Authentication> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isLogin = false;

  void loginMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void onBtnLoginClick() {
    _firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((AuthResult result) async {
      //declare
      SharedPreferences prefs = await SharedPreferences.getInstance();
      FirebaseUser user = result.user;

      //set localstorage
      await prefs.setString("uidUser", "${user.uid}");
      await prefs.setBool('isLogin', true);
      print(user);

      //clean form
      emailController.clear();
      passwordController.clear();

      //Navigator push
      Navigator.pushNamedAndRemoveUntil(
          context, '/Home', ModalRoute.withName('/Home'));
    });
  }
}
