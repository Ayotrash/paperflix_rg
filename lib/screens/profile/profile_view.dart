import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/profile/widgets/colors_list.dart';
import 'package:paperflix_rg/screens/profile/widgets/single_form.dart';
import 'package:paperflix_rg/screens/profile/widgets/single_list.dart';
import 'package:paperflix_rg/widgets/custom_chip.dart';
import 'package:paperflix_rg/widgets/social_list.dart';
import './profile_view_model.dart';

class ProfileView extends ProfileViewModel {
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 15, right: 15),
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 20),
                        width: screenSize.width,
                        constraints: BoxConstraints(minHeight: 200),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  textColor: Color(0xFF2dd573),
                                  onPressed: () {},
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
                                  "${userProfile['firstname'] ?? ""} ${userProfile['lastname'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("gender")}",
                              value:
                                  "${userProfile['gender'] == "male" ? "Male" : "Female" ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("email")}",
                              value: "${userProfile['email'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("birth-date")}",
                              value:
                                  "${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(userProfile['birth_date'] ?? DateTime.now().millisecondsSinceEpoch)) ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("place-of-birth")}",
                              value: "${userProfile['place_of_birth'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("phone-number")}",
                              value:
                                  "${userProfile['country_code'] ?? ""} ${userProfile['phone_number'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("job-title")}",
                              value: "${userProfile['job_title'] ?? ""}",
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
                              value: "${userProfile['country'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("province")}",
                              value: "${userProfile['province'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("city")}",
                              value: "${userProfile['city'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("address")}",
                              value: "${userProfile['address'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("nationality")}",
                              value: "${userProfile['nationality'] ?? ""}",
                            ),
                            SingleForm(
                              label:
                                  "${AppTranslations.of(context).text("driving-licenses")}",
                              value: "${userProfile['driving_licenses'] ?? ""}",
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: <Widget>[
                            profile
                                ? Container(
                                    width: 140,
                                    height: 140,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            "${userProfile['avatar'] == null ? gender == 0 ? 'https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572640034110.jpg?alt=media&token=f808358e-67e0-4edf-a147-eabc98abacd6' : 'https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7' : "${userProfile['avatar']}"}")),
                                  )
                                : Container(
                                    height: 140,
                                    width: 140,
                                    // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFf1f2f6),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: gender == 0
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF747d8c),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 20),
                      width: screenSize.width,
                      constraints: BoxConstraints(minHeight: 200),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  onPressed: () {},
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
                              value: "${userProfile['about_you'] ?? ""}",
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("employment-history-v2")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      userProfile['employment'].length ?? 0,
                                  itemBuilder: (context, i) {
                                    return SingleList(
                                      icon: Icons.work,
                                      value:
                                          "${userProfile['employment'][i]['job_title']} at ${userProfile['employment'][i]['company']}",
                                      subvalue:
                                          "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(userProfile['employment'][i]['start_date']))} - ${userProfile['employment'][i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(userProfile['employment'][i]['end_date']))}",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("education-v2")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      userProfile['education'].length ?? 0,
                                  itemBuilder: (context, i) {
                                    return SingleList(
                                      icon: Icons.work,
                                      value:
                                          "${userProfile['education'][i]['degree']} at ${userProfile['education'][i]['university']}",
                                      subvalue:
                                          "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(userProfile['education'][i]['start_date']))} - ${userProfile['education'][i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(userProfile['education'][i]['end_date']))}",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("skills-v2")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: userProfile['skills'].length ?? 0,
                                  itemBuilder: (context, i) {
                                    return ColorsList(
                                      color: colors[random.nextInt(6)],
                                      value:
                                          "${userProfile['skills'][i]['skill_type']}",
                                      subvalue:
                                          "${userProfile['skills'][i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : userProfile['skills'][i]['level'] == "intermediate" ? AppTranslations.of(context).text("intermediate") : userProfile['skills'][i]['level'] == "advanced" ? AppTranslations.of(context).text("advanced") : userProfile['skills'][i]['level'] == "expert" ? AppTranslations.of(context).text("expert") : ""}",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("out-school-activities")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                SingleList(
                                  icon: Icons.star,
                                  value: "E-Sport Indonesia",
                                  subvalue: "Feb 2015 - Dec 2018",
                                ),
                                SingleList(
                                  icon: Icons.star,
                                  value: "Hacker Organization ASEAN",
                                  subvalue: "Feb 2016 - Mar 2018",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("languages")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                SingleList(
                                  value: "English",
                                  subvalue:
                                      "${AppTranslations.of(context).text("conversational")}",
                                ),
                                SingleList(
                                  value: "Indonesia",
                                  subvalue:
                                      "${AppTranslations.of(context).text("native")}",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("hobby")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                Wrap(
                                  children: <Widget>[
                                    CustomChip("Swimming"),
                                    CustomChip("Coding"),
                                    CustomChip("Hacking"),
                                    CustomChip("Develop Apps"),
                                  ],
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "References",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                SingleList(
                                  image:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTRMSaEe9lkqLe9302uvVK1o3s1vEqJK_6Uo9Kj1bFtmX8hDEgA",
                                  value: "Azerino Gatots",
                                  subvalue: "jadiatlet.com",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("courses")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                SingleList(
                                  icon: Icons.flag,
                                  value: "Impact Byte Scholarship",
                                  subvalue: "Dec 2018 - Feb 2019",
                                ),
                                SingleList(
                                  icon: Icons.flag,
                                  value: "Computer Science at Udemy",
                                  subvalue: "Jun 2019 - Aug 2019",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
                              top: 20, left: 15, right: 15, bottom: 20),
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          width: screenSize.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      textColor: Color(0xFF2dd573),
                                      onPressed: () {},
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
                                  "${AppTranslations.of(context).text("web-and-socials")}",
                                  style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Color(0xFF2f3542)),
                                ),
                                SizedBox(height: 15),
                                SocialList(
                                  type: "facebook",
                                  value: "www.facebook.com",
                                ),
                                SocialList(
                                  type: "instagram",
                                  value: "www.github.com",
                                ),
                                SocialList(
                                  type: "github",
                                  value: "www.instagram.com",
                                ),
                                SocialList(
                                  type: "googleplus",
                                  value: "www.linkedin.com",
                                ),
                                SocialList(
                                  type: "linkedin",
                                  value: "www.google.com",
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
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
