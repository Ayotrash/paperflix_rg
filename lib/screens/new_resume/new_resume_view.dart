import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/colors_list.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_list.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_area.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_phone.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_text.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_form.dart';
import './new_resume_view_model.dart';

class NewResumeView extends NewResumeViewModel {
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
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("${AppTranslations.of(context).text("create-resume")}",
            style: TextStyle(
              fontFamily: "SFP_Text",
            )),
        actions: <Widget>[
          FlatButton(
            onPressed: () => changeStep(),
            textColor: Color(0xFFff4757),
            child: Text("${AppTranslations.of(context).text("skip")}",
                style: TextStyle(
                  fontFamily: "SFP_Text",
                )),
          )
        ],
      ),
         body: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width,
            height: screenSize.height,
            child: SafeArea(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      height: 120,
                      child: ListView(
                          controller: stepScroll,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 18),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 18),
                                            Container(
                                              width: currentStep == 0 ? 60 : 50,
                                              height: currentStep == 0 ? 60 : 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Icon(Icons.person,
                                                  size:
                                                      currentStep == 0 ? 33 : 22,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                                width: 100,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text("${AppTranslations.of(context).text("personal-info-v1")}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "SFP_Text",
                                            )),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                                width: 20,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                            Container(
                                              width: currentStep == 1 ? 60 : 50,
                                              height: currentStep == 1 ? 60 : 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Icon(Icons.assignment,
                                                  size:
                                                      currentStep == 1 ? 33 : 22,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                                width: 100,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text("${AppTranslations.of(context).text("professional-summary-v1")}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "SFP_Text",
                                            )),
                                      ],
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Container(
                                                width: 22,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                            Container(
                                              width: currentStep == 2 ? 60 : 50,
                                              height: currentStep == 2 ? 60 : 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Icon(Icons.business_center,
                                                  size:
                                                      currentStep == 2 ? 33 : 22,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                                width: 100,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                          ]),
                                          SizedBox(height: 10),
                                          Text("${AppTranslations.of(context).text("employment-history-v1")}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "SFP_Text",
                                              )),
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Container(
                                                width: 13,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                            Container(
                                              width: currentStep == 3 ? 60 : 50,
                                              height: currentStep == 3 ? 60 : 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Icon(Icons.school,
                                                  size:
                                                      currentStep == 3 ? 33 : 22,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                                width: 100,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                )),
                                          ]),
                                          SizedBox(height: 10),
                                          Text("${AppTranslations.of(context).text("education-v1")}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "SFP_Text",
                                              )),
                                          SizedBox(height: 19),
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Container(
                                              width: currentStep == 4 ? 60 : 50,
                                              height: currentStep == 4 ? 60 : 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2dd573),
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Icon(Icons.fitness_center,
                                                  size:
                                                      currentStep == 4 ? 33 : 22,
                                                  color: Colors.white),
                                            ),
                                          ]),
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(width: 5),
                                              Text("${AppTranslations.of(context).text("skills-v1")}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "SFP_Text",
                                                  )),
                                            ],
                                          ),
                                          SizedBox(height: 19),
                                        ]),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ],
                            )
                          ]),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 55),
                        child: ListView(
                          children: <Widget>[
                            if (currentStep == 0)
                        Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SingleForm(
                                  label: "${AppTranslations.of(context).text("full-name")}", value: "Arsyad Ramadhan"),
                              SingleForm(label: "${AppTranslations.of(context).text("gender")}", value: "Male"),
                              SingleForm(
                                  label: "${AppTranslations.of(context).text("email")}",
                                  value: "blacklistdark1987@gmail.com"),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    Text(
                                      "${AppTranslations.of(context).text("birth-date")}",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: Color(0xFF2f3542)),
                                    ),
                                    SizedBox(height: 7),
                                    RaisedButton(
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20, top: 12, bottom: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Color(0xFFf1f2f6),
                                      textColor: Color(0xFF2F3542),
                                      onPressed: () => selectBirthDate(context),
                                      child: Container(
                                        width: screenSize.width,
                                        child: Text(
                                            "${DateFormat('yyyy-MM-dd').format(selectedBirthDate)}",
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                  ]),
                              FormText(
                                label: "${AppTranslations.of(context).text("place-of-birth")}",
                                hint: "e.g. California, US.",
                              ),
                              FormPhone(
                                label: "${AppTranslations.of(context).text("phone-number")}",
                                hint: "e.g. 8123123123",
                              ),
                              FormText(
                                label: "${AppTranslations.of(context).text("job-title")}",
                                hint: "e.g. Marketing Executive, Sales etc.",
                                question: true,
                              ),
                              FormText(
                                label: "${AppTranslations.of(context).text("country")}",
                                hint: "e.g. United State",
                              ),
                              FormText(
                                label: "${AppTranslations.of(context).text("city")}",
                                hint: "e.g. California, New York",
                              ),
                              FormText(
                                label: "${AppTranslations.of(context).text("address")}",
                                hint: "e.g. 982 Lawrence Dr. Morristown, NJ 07960",
                              ),
                              FormText(
                                label: "${AppTranslations.of(context).text("driving-licenses")}",
                                hint: "...",
                                question: true,
                              ),
                              SizedBox(height: 20)
                            ],
                          ),
                        )
                    else if (currentStep == 1)
                        Container(
                            width: screenSize.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FormArea(
                                    label: "${AppTranslations.of(context).text("about-you")}",
                                    hint:
                                        "e.g. Passionate science teacher with 8+ years of experience and many other",
                                    question: true,
                                    minLines: 20,
                                    maxLines: 60,
                                  ),
                                  SizedBox(height: 20)
                                ]))
                    else if (currentStep == 2)
                        Container(
                            width: screenSize.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                            SizedBox(height: 15),
                                  !addEmployment
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 2,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            return SingleList(
                                              icon: Icons.work,
                                              value:
                                                  "Software Engineering at Paperflix",
                                              time: "Feb 2018 - ${AppTranslations.of(context).text("present")}",
                                              subvalue:
                                                  "Explore New Technology stack for build new application solution. Thinking about checkpoint and tracking send package solution.",
                                            );
                                          },
                                        )
                                      : Container(
                                          width: screenSize.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FormText(
                                                      label: "${AppTranslations.of(context).text("job-title")}",
                                                      hint:
                                                          "e.g. Marketing Manager",
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormText(
                                                      label: "${AppTranslations.of(context).text("company")}",
                                                      hint: "e.g. Google",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SFP_Text",
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF2f3542)),
                                                          ),
                                                          SizedBox(height: 7),
                                                          RaisedButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    top: 12,
                                                                    bottom: 12),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                            ),
                                                            color:
                                                                Color(0xFFf1f2f6),
                                                            textColor:
                                                                Color(0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width:
                                                                  screenSize.width,
                                                              child: Text(
                                                                  "${DateFormat('yyyy-MM-dd').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("end-date")}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SFP_Text",
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF2f3542)),
                                                          ),
                                                          SizedBox(height: 7),
                                                          RaisedButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    top: 12,
                                                                    bottom: 12),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                            ),
                                                            color:
                                                                Color(0xFFf1f2f6),
                                                            textColor:
                                                                Color(0xFF2F3542),
                                                            onPressed: () =>
                                                                selectEndDate(
                                                                    context),
                                                            child: Container(
                                                              width:
                                                                  screenSize.width,
                                                              child: Text(
                                                                  "${DateFormat('yyyy-MM-dd').format(selectedEndDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                              FormText(
                                                label: "${AppTranslations.of(context).text("city")}",
                                                hint: "e.g. California, New York",
                                              ),
                                              FormArea(
                                                label: "${AppTranslations.of(context).text("description")}",
                                                hint:
                                                    "e.g. I'am take responbilities with all of the student or employees in this company.",
                                                minLines: 10,
                                                maxLines: 20,
                                              )
                                            ],
                                          )),
                                  addEmployment
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddEmployment(),
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
                                  ),
                                  SizedBox(height: 20)
                                ]))
                    else if (currentStep == 3)
                        Container(
                            width: screenSize.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                            SizedBox(height: 15),
                                  !addEducation
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            return SingleList(
                                              icon: Icons.school,
                                              value: "SMKN 5 Malang",
                                              time: "Jun 2016 - Jun 2018",
                                              subvalue:
                                                  "Explore New Technology stack for build new application solution. Thinking about checkpoint and tracking send package solution.",
                                            );
                                          },
                                        )
                                      : Container(
                                          width: screenSize.width,
                                          child: Column(
                                            children: <Widget>[
                                              FormText(
                                                label: "${AppTranslations.of(context).text("university")}",
                                                hint: "e.g. Oxford University",
                                              ),
                                              FormText(
                                                label: "${AppTranslations.of(context).text("degree")}",
                                                hint: "e.g. Management Bachelor",
                                              ),
                                              FormText(
                                                label: "${AppTranslations.of(context).text("field-of-study")}",
                                                hint: "e.g. Bussiness",
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SFP_Text",
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF2f3542)),
                                                          ),
                                                          SizedBox(height: 7),
                                                          RaisedButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    top: 12,
                                                                    bottom: 12),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                            ),
                                                            color:
                                                                Color(0xFFf1f2f6),
                                                            textColor:
                                                                Color(0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width:
                                                                  screenSize.width,
                                                              child: Text(
                                                                  "${DateFormat('yyyy-MM-dd').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("end-date")}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SFP_Text",
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF2f3542)),
                                                          ),
                                                          SizedBox(height: 7),
                                                          RaisedButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    top: 12,
                                                                    bottom: 12),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                            ),
                                                            color:
                                                                Color(0xFFf1f2f6),
                                                            textColor:
                                                                Color(0xFF2F3542),
                                                            onPressed: () =>
                                                                selectEndDate(
                                                                    context),
                                                            child: Container(
                                                              width:
                                                                  screenSize.width,
                                                              child: Text(
                                                                  "${DateFormat('yyyy-MM-dd').format(selectedEndDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                              FormArea(
                                                label: "${AppTranslations.of(context).text("social-activities")}",
                                                hint:
                                                    "e.g. Volleyball, Student Council",
                                                minLines: 10,
                                                maxLines: 20,
                                              ),
                                              FormArea(
                                                label: "${AppTranslations.of(context).text("description")}",
                                                hint:
                                                    "e.g. I'am take responbilities with all of the student or employees in this company.",
                                                minLines: 10,
                                                maxLines: 20,
                                              )
                                            ],
                                          )),
                                  addEducation
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddEducation(),
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
                                  ),
                                  SizedBox(height: 20)
                                ]))
                    else if (currentStep == 4)
                        Container(
                            width: screenSize.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                            SizedBox(height: 15),
                                  !addEducation
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 3,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            return ColorsList(
                                              value: "Node JS",
                                              subvalue: "${AppTranslations.of(context).text("advanced")}",
                                              color: 0xFFff4757,
                                            );
                                          },
                                        )
                                      : Container(
                                          width: screenSize.width,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                FormText(
                                                  label: "${AppTranslations.of(context).text("type-skill")}",
                                                  hint: "e.g. Design Graphics",
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "${AppTranslations.of(context).text("level-skill")}",
                                                  style: TextStyle(
                                                      fontFamily: "SFP_Text",
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 13,
                                                      color: Color(0xFF2f3542)),
                                                ),
                                                SizedBox(height: 7),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  width: screenSize.width,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFf1f2f6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: new DropdownButton(
                                                      value: selectedLevel,
                                                      items: dropDownMenuItems,
                                                      onChanged:
                                                          changedDropDownItem,
                                                    ),
                                                  ),
                                                )
                                              ])),
                                  addSkills
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddEducation(),
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
                                  ),
                                  SizedBox(height: 20)
                                ])),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                children: <Widget>[
                  currentStep > 0
                      ? Expanded(
                          child: Container(
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(0)),
                              onPressed: () => backStep(),
                              color: Color(0xFF1e90ff),
                              textColor: Colors.white,
                              child: Text(
                                "${AppTranslations.of(context).text("back").toUpperCase()}",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "SFP_Text",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(0)),
                        onPressed: () => changeStep(),
                        color: Color(0xFF2dd573),
                        textColor: Colors.white,
                        child: Text(
                          currentStep < 4 ? "${AppTranslations.of(context).text("next").toUpperCase()}" : "${AppTranslations.of(context).text("finish").toUpperCase()}",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontFamily: "SFP_Text",
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ), 
    );
  }
}
