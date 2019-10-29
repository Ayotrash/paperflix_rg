import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import './custom_template_view_model.dart';

class CustomTemplateView extends CustomTemplateViewModel {
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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: Color(0xFFFAFAFA),
                  title: Text(
                      "${AppTranslations.of(context).text("custom-template")}",
                      style: TextStyle(
                        fontFamily: "SFP_Text",
                      )),
                )
              ];
            },
            body: Container(
              width: screenSize.width,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Stack(
                        children: <Widget>[
                          Container(
                              width: screenSize.width,
                              height: 320,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              color: Color(0xFFECECEC),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xFF313639),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                )),
                                            height: 320,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                )),
                                            height: 320,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        SizedBox(height: 30),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 15, bottom: 15),
                                              height: 60,
                                              color: Color(colorSelected),
                                            ),
                                            Container(
                                              height: 90,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  SizedBox(width: 15),
                                                  SizedBox(
                                                      height: 85,
                                                      width: 85,
                                                      child: Image.asset(
                                                        "assets/arsyad.jpg",
                                                      )),
                                                  SizedBox(width: 15),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "ARSYAD SUKMA RAMADHAN",
                                                        style: TextStyle(
                                                            letterSpacing: 0.8,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "SOFTWARE ENGINEER",
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            letterSpacing: 0.8,
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "PROFILE",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      "Nationality: Indonesian",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "Date / Place of Birth: 30 December 2000",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "Gender: Male",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "Status: Single",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "PROFILE",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      "- Frontend Development",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "- Mobile Development",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "- Graphic Design",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    Text(
                                                      "- UI/UX Design",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "CONTACT DETAILS",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "EMPLOYMENT HISTORY",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 9,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      "TECH MENTOR MOBILE DEVELOPMENT(FLUTTER)",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Nextbyte | May 2019 - Oct 2019",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 7,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      "SOFTWARE ENGINEER",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Nextbyte | Mar 2019 - Oct 2019",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 7,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      "I do make a Flutter Project: \n1.Nextbyte Champion: https://play.google.com/store/apps/details?id=com.apps.nextbyte_champion\n2.Nextbyte Feed : https://play.google.com/store/apps/details?id=com.nextbyte.nextbyte_feed",
                                                      style: TextStyle(
                                                        fontSize: 6,
                                                        fontFamily: "SFP_Text",
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      "SOFTWARE ENGINEER",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Next TI | Feb 2019 - Mar 2019",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 7,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      "FRONTEND ENGINEER",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Joreujima Software | Des 2017 - Sep 2018",
                                                      style: TextStyle(
                                                          color: Color(
                                                              colorSelected),
                                                          fontSize: 7,
                                                          fontFamily:
                                                              "SFP_Text",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            width: screenSize.width,
                            height: 320,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.1, 0.5, 2.1],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xFFFAFAFA),
                                  Color(0xFFFAFAFA).withOpacity(0.2),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "${AppTranslations.of(context).text("choose-theme")}",
                                style: TextStyle(
                                    fontFamily: "SFP_Text",
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: colors.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      width: 50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: colorSelected == colors[i] &&
                                                  colorsSelector[i]
                                              ? Border.all(
                                                  width: 2,
                                                  color: Color(colors[i]))
                                              : Border.all(
                                                  color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: RaisedButton(
                                        padding: EdgeInsets.zero,
                                        color: Color(colors[i]),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => onChangeColors(i),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "${AppTranslations.of(context).text("select-font")}",
                                style: TextStyle(
                                    fontFamily: "SFP_Text",
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: Color(0xFFf1f2f6),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: currentFont,
                                    items: dropDownMenuItems,
                                    onChanged: changedDropDownItem,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Container(
                                  width: screenSize.width - 100,
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {},
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    color: Color(0xFF2ed573),
                                    textColor: Colors.white,
                                    child: Text(
                                      "${AppTranslations.of(context).text("download-save").toUpperCase()}",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "SFP_Text",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          )),
                    ]),
              ),
            )));
  }
}
