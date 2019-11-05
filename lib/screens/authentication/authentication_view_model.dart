import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './authentication.dart';

abstract class AuthenticationViewModel extends State<Authentication> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final db = Firestore.instance;

  bool isLogin = false;
  bool isLoading = false;
  bool error = false;
  String message = "";
  String password;

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void loginMode() {
    emailController.clear();
    passwordController.clear();
    setState(() {
      isLogin = !isLogin;
      error = false;
      message = "";
    });
  }

  Future<void> checkPassword(String hash) async {
    bool result = await FlutterBcrypt.verify(
        password: '${passwordController.text}', hash: hash);
    print(result);
    await _firebaseAuth.signOut();
    if (result) {
      try {
        _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailController.text, password: hash)
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
          setState(() {
            error = false;
            message = "";
          });

          //Navigator push
          Navigator.pushNamedAndRemoveUntil(
              context, '/Home', ModalRoute.withName('/Home'));
          toggleLoading();
        }).catchError((err) {
          print(err);
          setState(() {
            error = true;
            message = "${err['statusCode']} ${err['message']}";
          });
        });
      } catch (err) {
        toggleLoading();
        print(err);
        setState(() {
          error = true;
          message = "${err['statusCode']} ${err['message']}";
        });
      }
    } else {
      toggleLoading();
      setState(() {
        error = true;
        message = "Wrong Password";
      });
    }
  }

  Future onBtnLoginClick() async {
    toggleLoading();
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: "${USERUPLOADER['email']}",
              password: "${USERUPLOADER['password']}")
          .then((AuthResult result) async {
        db
            .collection("users")
            .where("email", isEqualTo: "${emailController.text}")
            .snapshots()
            .listen((data) {
          if (data.documents.length > 0) {
            print('email: ${data.documents[0]['email']}');
            checkPassword(data.documents[0]['password']);
          } else {
            toggleLoading();
            setState(() {
              error = true;
              message = "Email not found";
            });
          }
        });
      }).catchError((err) {
        print(err);
      });
    } catch (e) {
      print(e);
    }
  }
}
