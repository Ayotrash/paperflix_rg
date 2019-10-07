import 'package:flutter/material.dart';
import './register.dart';

abstract class RegisterViewModel extends State<Register> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool terms = false;
}
