import 'package:flutter/material.dart';
import './home_view.dart';

class Home extends StatefulWidget {
  final String firstname, avatar, gender;

  Home({this.avatar, this.firstname, this.gender});

  @override
  HomeView createState() => new HomeView();
}
