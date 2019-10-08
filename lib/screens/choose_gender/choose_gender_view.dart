import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/register/register.dart';
import './choose_gender_view_model.dart';

class ChooseGenderView extends ChooseGenderViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Choose Gender",
          style: TextStyle(fontFamily: "SFP_Text"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Please choose your gender.",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "SFP_Text",
                    fontSize: 16,
                    letterSpacing: 0.6),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Color(0xFFFF8FCF),
                      onPressed: () => Navigator.push(
                          context,
                          NavigationRoute(
                              enterPage: Register(
                            gender: 0,
                          ))),
                      child: Container(
                        height: 140,
                        width: 140,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.asset("assets/girl.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Female",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "SFP_Text",
                            fontSize: 15))
                  ]),
                  SizedBox(width: 15),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Color(0xFF6AAFFF),
                        onPressed: () => Navigator.push(
                          context,
                          NavigationRoute(
                              enterPage: Register(
                            gender: 1,
                          ))),
                        child: Container(
                          height: 140,
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset("assets/boy.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Male",
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              fontWeight: FontWeight.w700,
                              fontSize: 15))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
