import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/choose_gender/choose_gender.dart';
import './authentication_view_model.dart';

class AuthenticationView extends AuthenticationViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.transparent,
          ),
          Container(
            width: screenSize.width,
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xFFECECEC),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                )),
          ),
          SafeArea(
            child: Container(
              width: screenSize.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      child: Image.asset('assets/mini-logo.png'),
                    ),
                    SizedBox(height: 80),
                    SizedBox(
                      height: 180,
                      child: Image.asset('assets/curriculum.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Make Your CV Easily",
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "Paperflix is a CV generator that help you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      "build CV more easily",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    SizedBox(height: 80),
                    Container(
                      width: screenSize.width - 100,
                      margin: EdgeInsets.only(bottom: 15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () => Navigator.push(context,
                            NavigationRoute(enterPage: ChooseGender())),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        color: Color(0xFF2ed573),
                        textColor: Colors.white,
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              letterSpacing: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "or, if you have an account",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "SFP_Text",
                          fontSize: 16,
                          color: Color(0xFF2ed573)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: screenSize.width - 100,
                      margin: EdgeInsets.only(bottom: 15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Color(0xFF2ed573),
                        textColor: Colors.white,
                        child: Text(
                          "PLEASE, LOGIN",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontFamily: "SFP_Text",
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
