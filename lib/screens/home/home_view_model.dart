import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool profileImage = false;
  int gender = 1;
  Map userProfile = Map();

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("uid");
    await prefs.remove("isLogin");
    storage.clear();
    _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, '/Auth', ModalRoute.withName('/Auth'));
  }

  @override
  void initState() {
    storage.ready.then((_) {
      userProfile = storage.getItem('userProfile');
      if (userProfile['avatar'] != null) {
        profileImage = true;
      } else {
        profileImage = false;
      }
      if (userProfile['gender'] == "male") {
        gender = 1;
      } else {
        gender = 0;
      }
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(profileImage);
      print(gender);
    });
  }
}
