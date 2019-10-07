import 'package:flutter/material.dart';
import './register_view.dart';

class Register extends StatefulWidget {
  final int gender; // 0=woman && 1=man

  Register({this.gender});

  @override
  RegisterView createState() => new RegisterView();
}
