import 'package:flutter/material.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/new_resume/new_resume.dart';

class WithoutResumeBanner extends StatefulWidget {
  @override
  _WithoutResumeBannerState createState() => _WithoutResumeBannerState();
}

class _WithoutResumeBannerState extends State<WithoutResumeBanner> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
        return SafeArea(
          child: Scaffold(
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${AppTranslations.of(context).text("please-fill-resume")}.",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "SFP_Text",
                        fontSize: 18,
                        color: Color(0xFF2f3542)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenSize.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => Navigator.push(
                          context, NavigationRoute(enterPage: NewResume())),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      color: Color(0xFF2dd573),
                      textColor: Colors.white,
                      child: Text(
                        "${AppTranslations.of(context).text("create-resume-v2").toUpperCase()}",
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
        );
  }
}