import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
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
    return WillPopScope(
      onWillPop: () async {
        if (isLogin) {
          setState(() {
            isLogin = !isLogin;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.transparent,
            ),
            !isLogin
                ? Container(
                    width: screenSize.width,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(300),
                          bottomRight: Radius.circular(300),
                        )),
                  )
                : Container(),
            SafeArea(
              child: Container(
                width: screenSize.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      !isLogin
                          ? Column(
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
                                  "${AppTranslations.of(context).text("opening-title")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  "${AppTranslations.of(context).text("opening-subtitle1")}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${AppTranslations.of(context).text("opening-subtitle2")}",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () => Navigator.push(
                                        context,
                                        NavigationRoute(
                                            enterPage: ChooseGender())),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    color: Color(0xFF2dd573),
                                    textColor: Colors.white,
                                    child: Text(
                                      "${AppTranslations.of(context).text("register").toUpperCase()}",
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
                                  "${AppTranslations.of(context).text("have-account")}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "SFP_Text",
                                      fontSize: 16,
                                      color: Color(0xFF2dd573)),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: screenSize.width - 100,
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () => loginMode(),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    color: Color(0xFF2dd573),
                                    textColor: Colors.white,
                                    child: Text(
                                      "${AppTranslations.of(context).text("please-login").toUpperCase()}",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "SFP_Text",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20)
                              ],
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 70),
                                  Center(
                                    child: SizedBox(
                                      height: 70,
                                      child:
                                          Image.asset('assets/mini-logo.png'),
                                    ),
                                  ),
                                  SizedBox(height: 70),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 8, bottom: 8),
                                    child: Text(
                                      "${AppTranslations.of(context).text("email")}",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFf1f2f6),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2F3542),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFced6e0),
                                          hintText: "e.g. johndoe@gmail.com",
                                          hintStyle: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 14,
                                            color: Color(0xFF9D9D9D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 8, bottom: 8),
                                    child: Text(
                                      "${AppTranslations.of(context).text("password")}",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFf1f2f6),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2F3542),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        obscureText: true,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFced6e0),
                                          hintText: "************",
                                          hintStyle: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 14,
                                            color: Color(0xFF9D9D9D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      )),
                                  SizedBox(height: 20),
                                  error
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          width: screenSize.width,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFff4757)
                                                  .withOpacity(0.9),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "$message",
                                            style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "SFP_Text",
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        )
                                      : SizedBox(),
                                  error ? SizedBox(height: 20) : SizedBox(),
                                  Center(
                                    child: Container(
                                      width: screenSize.width - 100,
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () =>
                                            !isLoading ? onBtnLoginClick() : {},
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: isLoading
                                            ? Center(
                                                child: Loading(
                                                    indicator:
                                                        BallSpinFadeLoaderIndicator(),
                                                    size: 20.0))
                                            : Text(
                                                "${AppTranslations.of(context).text("login").toUpperCase()}",
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
