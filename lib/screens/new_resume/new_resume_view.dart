import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFFFAFAFA),
            automaticallyImplyLeading: false,
            title: Text("Create New Resume",
                style: TextStyle(
                  fontFamily: "SFP_Text",
                )),
            actions: <Widget>[
              FlatButton(
                onPressed: () => changeStep(),
                textColor: Color(0xFFff4757),
                child: Text("Skip",
                    style: TextStyle(
                      fontFamily: "SFP_Text",
                    )),
              )
            ],
          )
        ];
      },
      body: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width,
            height: screenSize.height,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 20),
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 18),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF2ed573),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(Icons.person,
                                          color: Colors.white),
                                    ),
                                    Container(
                                        width: 100,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF2ed573),
                                        )),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF2ed573),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(Icons.assignment,
                                          color: Colors.white),
                                    ),
                                    Container(
                                        width: 100,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF2ed573),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text("Personal\nInformation",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "SFP_Text",
                                    )),
                              ],
                            )
                          ]),
                    ),
                    if (currentStep == 0)
                      Container(
                        width: screenSize.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SingleForm(
                                label: "Full Name", value: "Arsyad Ramadhan"),
                            SingleForm(label: "Gender", value: "Male"),
                            SingleForm(
                                label: "Email",
                                value: "blacklistdark1987@gmail.com"),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Text(
                                    "Birth Date",
                                    style: TextStyle(
                                        fontFamily: "SFP_Text",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Color(0xFF2f3542)),
                                  ),
                                  SizedBox(height: 7),
                                  RaisedButton(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 12,
                                        bottom: 12),
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
                              label: "Place of Birth",
                              hint: "e.g. California, US.",
                            ),
                            FormPhone(
                              label: "Phone Number",
                              hint: "e.g. 8123123123",
                            ),
                            FormText(
                              label: "Job Title",
                              hint: "e.g. Marketing Executive, Sales etc.",
                              question: true,
                            ),
                            FormText(
                              label: "Country",
                              hint: "e.g. United State",
                            ),
                            FormText(
                              label: "City",
                              hint: "e.g. California, New York",
                            ),
                            FormText(
                              label: "Address",
                              hint:
                                  "e.g. 982 Lawrence Dr. Morristown, NJ 07960",
                            ),
                            FormText(
                              label: "Driving Licenses",
                              hint: "...",
                              question: true,
                            ),
                            SizedBox(height: 70)
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
                                  label: "About you",
                                  hint:
                                      "e.g. Passionate science teacher with 8+ years of experience and many other",
                                  question: true,
                                  minLines: 20,
                                  maxLines: 60,
                                ),
                                SizedBox(height: 70)
                              ]))
                    else if (currentStep == 2)
                      Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
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
                                            time: "Feb 2018 - Present",
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
                                                    label: "Job Title",
                                                    hint:
                                                        "e.g. Marketing Manager",
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: FormText(
                                                    label: "Company",
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
                                                          "Start Date",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SFP_Text",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          color:
                                                              Color(0xFFf1f2f6),
                                                          textColor:
                                                              Color(0xFF2F3542),
                                                          onPressed: () =>
                                                              selectStartDate(
                                                                  context),
                                                          child: Container(
                                                            width: screenSize
                                                                .width,
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
                                                          "End Date",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SFP_Text",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          color:
                                                              Color(0xFFf1f2f6),
                                                          textColor:
                                                              Color(0xFF2F3542),
                                                          onPressed: () =>
                                                              selectEndDate(
                                                                  context),
                                                          child: Container(
                                                            width: screenSize
                                                                .width,
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
                                              label: "City",
                                              hint: "e.g. California, New York",
                                            ),
                                            FormArea(
                                              label: "Description",
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () => onBtnAddEmployment(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    color: Color(0xFF2ed573),
                                    textColor: Colors.white,
                                    child: Text(
                                      "+ Add Employment",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70)
                              ]))
                    else if (currentStep == 3)
                      Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
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
                                              label: "University",
                                              hint: "e.g. Oxford University",
                                            ),
                                            FormText(
                                              label: "Degree",
                                              hint: "e.g. Management Bachelor",
                                            ),
                                            FormText(
                                              label: "Field of Study",
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
                                                          "Start Date",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SFP_Text",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          color:
                                                              Color(0xFFf1f2f6),
                                                          textColor:
                                                              Color(0xFF2F3542),
                                                          onPressed: () =>
                                                              selectStartDate(
                                                                  context),
                                                          child: Container(
                                                            width: screenSize
                                                                .width,
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
                                                          "End Date",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SFP_Text",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          color:
                                                              Color(0xFFf1f2f6),
                                                          textColor:
                                                              Color(0xFF2F3542),
                                                          onPressed: () =>
                                                              selectEndDate(
                                                                  context),
                                                          child: Container(
                                                            width: screenSize
                                                                .width,
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
                                              label: "Social Activities",
                                              hint:
                                                  "e.g. Volleyball, Student Council",
                                              minLines: 10,
                                              maxLines: 20,
                                            ),
                                            FormArea(
                                              label: "Description",
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () => onBtnAddEducation(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    color: Color(0xFF2ed573),
                                    textColor: Colors.white,
                                    child: Text(
                                      "+ Add Education",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70)
                              ]))
                    else if (currentStep == 4)
                      Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[])),
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
                                "BACK",
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
                        color: Color(0xFF2ed573),
                        textColor: Colors.white,
                        child: Text(
                          "NEXT",
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
    ));
  }
}
