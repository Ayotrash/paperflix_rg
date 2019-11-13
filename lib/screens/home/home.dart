import 'package:flutter/material.dart';
import './home_view.dart';

class Home extends StatefulWidget {
  final String firstname, gender;

  Home({this.firstname, this.gender});

  @override
  HomeView createState() => new HomeView();
}
