import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:paperflix_rg/widgets/without_resume_banner.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  void toggleLoading() {
    if (this.mounted) {
      setState(() {
        isLoading = !isLoading;
      });
    }
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

  Future<void> checkPassword(String hash, data) async {
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
          //
          SharedPreferences prefs = await SharedPreferences.getInstance();
          FirebaseUser user = result.user;

          //set localstorage
          await prefs.setString("uidUser", "${user.uid}");
          await prefs.setBool('isLogin', true);
          print(user);
          print(data);

          storage.setItem('userProfile', Map<String, dynamic>.from(data));

          //clean form
          emailController.clear();
          passwordController.clear();
          setState(() {
            error = false;
            message = "";
          });

          //Navigator push
          if (!data.containsKey('place_of_birth') ||
              !data.containsKey('phone') ||
              !data.containsKey('job_title') ||
              !data.containsKey('country') ||
              !data.containsKey('province') ||
              !data.containsKey('address') ||
              !data.containsKey('about_you') ||
              !data.containsKey('employment') ||
              !data.containsKey('education') ||
              !data.containsKey('skills') ||
              data['place_of_birth'].length <= 0 ||
              data['phone'].length <= 0 ||
              data['job_title'].length <= 0 ||
              data['country'].length <= 0 ||
              data['province'].length <= 0 ||
              data['address'].length <= 0 ||
              data['city'].length <= 0 ||
              data['about_you'].length <= 0 ||
              data['employment'].length <= 0 ||
              data['education'].length <= 0 ||
              data['skills'].length <= 0) {
            print("Not Go Home");
            Navigator.of(context).pushAndRemoveUntil(
                NavigationRoute(enterPage: WithoutResumeBanner()),
                ModalRoute.withName('/Auth'));
          } else {
            print("Go Home");
            Navigator.of(context).pushAndRemoveUntil(
                NavigationRoute(
                    enterPage: Home(
                  firstname: data['firstname'] == null ? "" : "Anonim",
                  gender: data['gender'] == 'male' ? "male" : 'female',
                )),
                ModalRoute.withName('/Auth'));
          }
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
      if (this.mounted) {
        setState(() {
          error = true;
          message = "Wrong Password";
        });
      }
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
            checkPassword(
                data.documents[0]['password'], data.documents[0].data);
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
