import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import './register_view_model.dart';

class RegisterView extends RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFFFAFAFA),
            title: Text("${AppTranslations.of(context).text("register")}",
                style: TextStyle(
                  fontFamily: "SFP_Text",
                )),
          )
        ];
      },
      body: AnimatedOpacity(
        opacity: isLoading ? 0.0 : 1.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: screenSize.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 140,
                      width: 140,
                      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: Color(0xFFf1f2f6),
                          borderRadius: BorderRadius.circular(15)),
                      child: imageUrl != null
                          ? SizedBox(
                              height: 140,
                              width: 140,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("$imageUrl")))
                          : SizedBox(
                              height: 120,
                              width: 120,
                              child: widget.gender == 0
                                  ? Image.asset("assets/girl.png")
                                  : Image.asset("assets/boy.png"),
                            ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        child: RaisedButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => imageSelect(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(0xFF747d8c),
                          textColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 8),
                        child: Text(
                          "${AppTranslations.of(context).text("firstname")}",
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
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
                            controller: firstnameController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFced6e0),
                              hintText: "e.g. John",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "SFP_Text",
                                color: Color(0xFF9D9D9D),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          )),
                      errorFirstname
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                "$messageFirstname",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 12,
                                    color: Colors.red),
                              ))
                          : SizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 8, bottom: 8),
                        child: Text(
                          "${AppTranslations.of(context).text("lastname")}",
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
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
                            controller: lastnameController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFced6e0),
                              hintText: "e.g. Doe",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "SFP_Text",
                                color: Color(0xFF9D9D9D),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          )),
                      errorLastname
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                "$messageLastname",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 12,
                                    color: Colors.red),
                              ))
                          : SizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 8, bottom: 8),
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
                              left: 20, right: 20, top: 5, bottom: 5),
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
                            keyboardType: TextInputType.emailAddress,
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
                      errorEmailNotFill
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                "$messageEmail",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 12,
                                    color: Colors.red),
                              ))
                          : SizedBox(),
                      errorEmail
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: RichText(
                                text: new TextSpan(
                                  text: 'Email ',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontFamily: "SFP_Text",
                                      fontSize: 12,
                                      color: Colors.red),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: '${emailController.text}',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    new TextSpan(
                                        text:
                                            ' has already taken by other user.'),
                                  ],
                                ),
                              ))
                          : SizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 8, bottom: 8),
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
                              left: 20, right: 20, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFf1f2f6),
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SFP_Text",
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
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "*${AppTranslations.of(context).text("password-terms")}",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SFP_Text",
                            color: Color(0xFF2F3542),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      errorPassword
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                "$messagePassword",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 12,
                                    color: Colors.red),
                              ))
                          : SizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 8, bottom: 8),
                        child: Text(
                          "${AppTranslations.of(context).text("confirm-password")}",
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFf1f2f6),
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SFP_Text",
                              color: Color(0xFF2F3542),
                              fontWeight: FontWeight.w500,
                            ),
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFced6e0),
                              hintText: "************",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "SFP_Text",
                                color: Color(0xFF9D9D9D),
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          )),
                      errorConfirm
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                "$messageConfirm",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 12,
                                    color: Colors.red),
                              ))
                          : SizedBox(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Color(0xFF2f3542),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: terms,
                        onChanged: (bool value) {
                          setState(() {
                            terms = value;
                          });
                        },
                      ),
                      Flexible(
                          child: RichText(
                        text: new TextSpan(
                          text:
                              '${AppTranslations.of(context).text("agree-terms")}',
                          style: TextStyle(
                              fontFamily: "SFP_Text",
                              fontSize: 13.3,
                              color: Color(0xFF2f3542)),
                          children: <TextSpan>[
                            new TextSpan(
                                text:
                                    ' ${AppTranslations.of(context).text("terms-conditions")}',
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                            new TextSpan(text: '.'),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenSize.width - 100,
                  margin: EdgeInsets.only(bottom: 15),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () =>
                        terms || isLoading ? onBtnRegisterPressed() : {},
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    color: terms ? Color(0xFF2dd573) : Color(0xFF81d4a3),
                    textColor: Colors.white,
                    child: isLoading
                        ? Center(
                            child: Loading(
                                indicator: BallSpinFadeLoaderIndicator(), size: 20.0))
                        : Text(
                            "${AppTranslations.of(context).text("register").toUpperCase()}",
                            style: TextStyle(
                                fontFamily: "SFP_Text",
                                letterSpacing: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
