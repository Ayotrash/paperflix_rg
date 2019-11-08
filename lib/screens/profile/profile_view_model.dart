import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paperflix_rg/config/config.dart';
import './profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  int gender = 0;
  bool profile = false;
  Map userProfile = Map();

  List colors = [
    0xFFff4757,
    0xFF2ed573,
    0xFFffa502,
    0xFFff6b81,
    0xFF1e90ff,
    0xFF3742fa
  ];
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    storage.ready.then((_) {
      userProfile = storage.getItem('userProfile');
      if (userProfile['avatar'] != null) {
        profile = true;
      } else {
        profile = false;
      }
      if (userProfile['gender'] == "male") {
        gender = 1;
      } else {
        gender = 0;
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(profile);
      print(gender);
    });
  }
}
