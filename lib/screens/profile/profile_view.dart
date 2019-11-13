import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/edit_profile/edit_profile.dart';
import 'package:paperflix_rg/screens/profile/widgets/colors_list.dart';
import 'package:paperflix_rg/screens/profile/widgets/single_form.dart';
import 'package:paperflix_rg/screens/profile/widgets/single_list.dart';
import 'package:paperflix_rg/widgets/custom_chip.dart';
import 'package:paperflix_rg/widgets/social_list.dart';
import './profile_view_model.dart';

class ProfileView extends ProfileViewModel {
  Widget getHobbiesWidgets(List strings) {
    return new Wrap(
        children: strings.map((item) => new CustomChip(item)).toList());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Color(0xFFFAFAFA),
              title: Text("${AppTranslations.of(context).text("your-profile")}",
                  style: TextStyle(
                    fontFamily: "SFP_Text",
                  )),
            )
          ];
        },
        body: Container(
          width: screenSize.width,
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: storage.ready,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  } else {
                    Map<String, dynamic> data = storage.getItem('userProfile');

                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 500),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 25),
                            Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 70, left: 15, right: 15),
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 5, bottom: 20),
                                  width: screenSize.width,
                                  constraints: BoxConstraints(minHeight: 200),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 10),
                                            textColor: Color(0xFF2dd573),
                                            onPressed: () => Navigator.push(
                                                context,
                                                NavigationRoute(
                                                    enterPage: EditProfile(
                                                  type: 0,
                                                  avatar:
                                                      "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                ))),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  "${AppTranslations.of(context).text("edit")}",
                                                  style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        "${AppTranslations.of(context).text("personal-info-v2")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: Color(0xFF2f3542)),
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("full-name")}",
                                        value:
                                            "${data['firstname'] ?? ""} ${data['lastname'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("gender")}",
                                        value:
                                            "${data['gender'] == "male" ? "Male" : "Female" ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("email")}",
                                        value: "${data['email'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("birth-date")}",
                                        value:
                                            "${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(data['bod'] ?? DateTime.now().millisecondsSinceEpoch)) ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("place-of-birth")}",
                                        value:
                                            "${data['place_of_birth'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("phone-number")}",
                                        value:
                                            "${data['country_code'] ?? ""} ${data['phone'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("job-title")}",
                                        value: "${data['job_title'] ?? ""}",
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        "${AppTranslations.of(context).text("additional-info")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: Color(0xFF2f3542)),
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("country")}",
                                        value: "${data['country'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("province")}",
                                        value: "${data['province'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("city")}",
                                        value: "${data['city'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("address")}",
                                        value: "${data['address'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("nationality")}",
                                        value: "${data['nationality'] ?? ""}",
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("driving-licenses")}",
                                        value:
                                            "${data['driving_licenses'] ?? ""}",
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Stack(
                                    children: <Widget>[
                                      data['avatar'] != null
                                          ? Container(
                                              width: 140,
                                              height: 140,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFf1f2f6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.network(
                                                      "${imageUrl == null ? data['avatar'] : imageUrl}")),
                                            )
                                          : Container(
                                              height: 140,
                                              width: 140,
                                              // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFf1f2f6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: SizedBox(
                                                height: 120,
                                                width: 120,
                                                child: data['gender'] == 0
                                                    ? Image.asset(
                                                        "assets/girl.png")
                                                    : Image.asset(
                                                        "assets/boy.png"),
                                              ),
                                            ),
                                      Positioned(
                                        right: 5,
                                        bottom: 5,
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: RaisedButton(
                                            onPressed: () =>
                                                imageSelect(context),
                                            padding: EdgeInsets.zero,
                                            color: Color(0xFF747d8c),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5, bottom: 20),
                                width: screenSize.width,
                                constraints: BoxConstraints(minHeight: 200),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            onPressed: () => Navigator.push(
                                                context,
                                                NavigationRoute(
                                                    enterPage: EditProfile(
                                                  type: 1,
                                                  avatar:
                                                      "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                ))),
                                            textColor: Color(0xFF2dd573),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  "${AppTranslations.of(context).text("edit")}",
                                                  style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "${AppTranslations.of(context).text("professional-summary-v2")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: Color(0xFF2f3542)),
                                      ),
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("about-you")}",
                                        value:
                                            "${data['about_you'].length == 300 ? data['about_you'].toString().substring(0, 299) : data['about_you']}",
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          textColor: Color(0xFF747d8c),
                                          onPressed: () {},
                                          child: Text(
                                            "${AppTranslations.of(context).text("see-more")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )
                                    ])),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 2,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("employment-history-v2")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                employmentList.length ?? 0,
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.work,
                                                value:
                                                    "${employmentList[i]['job_title']} at ${employmentList[i]['company']}",
                                                subvalue:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(employmentList[i]['start_date']))} - ${employmentList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(employmentList[i]['end_date']))}",
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 0),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("employment")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 3,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("education-v2")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                educationList.length ?? 0,
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.work,
                                                value:
                                                    "${educationList[i]['degree']} at ${educationList[i]['university']}",
                                                subvalue:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(educationList[i]['start_date']))} - ${educationList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(educationList[i]['end_date']))}",
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 2),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("education-v2")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 4,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("skills-v2")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: skillsList.length ?? 0,
                                            itemBuilder: (context, i) {
                                              return ColorsList(
                                                color:
                                                    colors[random.nextInt(6)],
                                                value:
                                                    "${skillsList[i]['skill_type']}",
                                                subvalue:
                                                    "${skillsList[i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : skillsList[i]['level'] == "intermediate" ? AppTranslations.of(context).text("intermediate") : skillsList[i]['level'] == "advanced" ? AppTranslations.of(context).text("advanced") : skillsList[i]['level'] == "expert" ? AppTranslations.of(context).text("expert") : ""}",
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("skills-v2")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 5,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("out-school-activities")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: outSchoolActivitiesList
                                                    .length ??
                                                0,
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.directions_run,
                                                value:
                                                    "${outSchoolActivitiesList[i]['function_title']} at ${outSchoolActivitiesList[i]['organization']}",
                                                subvalue:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(outSchoolActivitiesList[i]['start_date']))} - ${outSchoolActivitiesList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(outSchoolActivitiesList[i]['end_date']))}",
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 1),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("activities")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 6,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("languages")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                languagesList.length ?? 0,
                                            itemBuilder: (context, i) {
                                              return ColorsList(
                                                color:
                                                    colors[random.nextInt(6)],
                                                value:
                                                    "${languagesList[i]['language']}",
                                                subvalue:
                                                    "${AppTranslations.of(context).text('${languagesList[i]['level']}')}",
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 6),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("languages")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 7,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("hobby")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          getHobbiesWidgets(hobbiesList),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 8),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("hobby")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 8,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("references")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  referencesList.length ?? 0,
                                              itemBuilder: (context, i) {
                                                return SingleList(
                                                  image:
                                                      "${referencesList[i]['image']}",
                                                  value:
                                                      "${referencesList[i]['fullname']} at ${referencesList[i]['company']}",
                                                  subvalue:
                                                      "${referencesList[i]['email']} - ${referencesList[i]['phone']}",
                                                );
                                              }),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 4),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("references")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 9,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("courses")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  coursesList.length ?? 0,
                                              itemBuilder: (context, i) {
                                                return SingleList(
                                                  icon: Icons.flag,
                                                  value:
                                                      "${coursesList[i]['course']} at ${coursesList[i]['institution']}",
                                                  subvalue:
                                                      "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(coursesList[i]['start_date']))} - ${coursesList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(coursesList[i]['end_date']))}",
                                                );
                                              }),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 3),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("courses")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 5,
                                        bottom: 20),
                                    width: screenSize.width,
                                    constraints: BoxConstraints(minHeight: 200),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 10),
                                                textColor: Color(0xFF2dd573),
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    NavigationRoute(
                                                        enterPage: EditProfile(
                                                      type: 10,
                                                      avatar:
                                                          "${imageUrl == null ? data['avatar'] : imageUrl}",
                                                    ))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "${AppTranslations.of(context).text("edit")}",
                                                      style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${AppTranslations.of(context).text("web-and-socials")}",
                                            style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Color(0xFF2f3542)),
                                          ),
                                          SizedBox(height: 15),
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: socialList.length ?? 0,
                                              itemBuilder: (context, i) {
                                                return SocialList(
                                                  type:
                                                      "${socialList[i]['type']}",
                                                  value:
                                                      "${socialList[i]['link']}",
                                                );
                                              }),
                                          SizedBox(height: 20)
                                        ])),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => dialogAdd(context, 7),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        color: Color(0xFF2dd573),
                                        textColor: Colors.white,
                                        child: Text(
                                          "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("socials")}",
                                          style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 20),
                          ]),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
