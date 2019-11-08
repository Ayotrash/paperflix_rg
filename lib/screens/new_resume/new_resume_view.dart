import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/colors_list.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/select_suggestion.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_list.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_area.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_phone.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_text.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_form.dart';
import 'package:paperflix_rg/widgets/custom_chip.dart';
import 'package:paperflix_rg/widgets/social_list.dart';
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
    return WillPopScope(
      onWillPop: () => willPopDialog(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("${AppTranslations.of(context).text("create-resume")}",
              style: TextStyle(
                fontFamily: "SFP_Text",
              )),
          // actions: <Widget>[
          //   FlatButton(
          //     onPressed: () => skipStep(context),
          //     textColor: Color(0xFFff4757),
          //     child: Text("${AppTranslations.of(context).text("skip")}",
          //         style: TextStyle(
          //           fontFamily: "SFP_Text",
          //         )),
          //   )
          // ],
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
                                                width:
                                                    currentStep == 0 ? 60 : 50,
                                                height:
                                                    currentStep == 0 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.person,
                                                    size: currentStep == 0
                                                        ? 33
                                                        : 22,
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
                                          Text(
                                              "${AppTranslations.of(context).text("personal-info-v1")}",
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
                                                width:
                                                    currentStep == 1 ? 60 : 50,
                                                height:
                                                    currentStep == 1 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.assignment,
                                                    size: currentStep == 1
                                                        ? 33
                                                        : 22,
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
                                          Text(
                                              "${AppTranslations.of(context).text("professional-summary-v1")}",
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
                                                width:
                                                    currentStep == 2 ? 60 : 50,
                                                height:
                                                    currentStep == 2 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(
                                                    Icons.business_center,
                                                    size: currentStep == 2
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 2
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("employment-history-v1")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
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
                                                width:
                                                    currentStep == 3 ? 60 : 50,
                                                height:
                                                    currentStep == 3 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.school,
                                                    size: currentStep == 3
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 3
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("education-v1")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                width:
                                                    currentStep == 4 ? 60 : 50,
                                                height:
                                                    currentStep == 4 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(
                                                    Icons.fitness_center,
                                                    size: currentStep == 4
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 4
                                                    ? SizedBox(width: 10)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("skills-v1")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 16,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                  )),
                                              Container(
                                                width:
                                                    currentStep == 5 ? 60 : 50,
                                                height:
                                                    currentStep == 5 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(
                                                    Icons.directions_run,
                                                    size: currentStep == 5
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 5
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("out-school-activities-v2")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 16,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                  )),
                                              Container(
                                                width:
                                                    currentStep == 6 ? 60 : 50,
                                                height:
                                                    currentStep == 6 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.language,
                                                    size: currentStep == 6
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 6
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("languages")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                width:
                                                    currentStep == 7 ? 60 : 50,
                                                height:
                                                    currentStep == 7 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.language,
                                                    size: currentStep == 7
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 7
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("hobby")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 19,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                  )),
                                              Container(
                                                width:
                                                    currentStep == 8 ? 60 : 50,
                                                height:
                                                    currentStep == 8 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.bookmark,
                                                    size: currentStep == 8
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 8
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("references")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 8,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                  )),
                                              Container(
                                                width:
                                                    currentStep == 9 ? 60 : 50,
                                                height:
                                                    currentStep == 9 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.bookmark,
                                                    size: currentStep == 9
                                                        ? 33
                                                        : 22,
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
                                            Row(
                                              children: <Widget>[
                                                currentStep == 9
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("courses")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 19),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 12,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                  )),
                                              Container(
                                                width:
                                                    currentStep == 10 ? 60 : 50,
                                                height:
                                                    currentStep == 10 ? 60 : 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2dd573),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(Icons.public,
                                                    size: currentStep == 10
                                                        ? 33
                                                        : 22,
                                                    color: Colors.white),
                                              ),
                                            ]),
                                            SizedBox(height: 10),
                                            Row(
                                              children: <Widget>[
                                                currentStep == 10
                                                    ? SizedBox(width: 5)
                                                    : SizedBox(),
                                                Text(
                                                    "${AppTranslations.of(context).text("web-and-socials-v2")}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "SFP_Text",
                                                    )),
                                              ],
                                            ),
                                          ]),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      fullnameEdit
                                          ? Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                FormText(
                                                  label:
                                                      "${AppTranslations.of(context).text("firstname")}",
                                                  hint:
                                                      "${firstnameController.text}",
                                                  controller:
                                                      firstnameController,
                                                ),
                                                FormText(
                                                  label:
                                                      "${AppTranslations.of(context).text("lastname")}",
                                                  hint:
                                                      "${lastnameController.text}",
                                                  controller:
                                                      lastnameController,
                                                )
                                              ],
                                            )
                                          : SingleForm(
                                              label:
                                                  "${AppTranslations.of(context).text("full-name")}",
                                              value:
                                                  "${firstnameController.text} ${lastnameController.text}",
                                              onEdit: onEditFullname,
                                            ),
                                      genderEdit
                                          ? Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(height: 10),
                                                Text(
                                                  "${AppTranslations.of(context).text("gender")}",
                                                  style: TextStyle(
                                                      fontFamily: "SFP_Text",
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(height: 10),
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
                                                      value: currentGender,
                                                      items: dropDownMenuGender,
                                                      onChanged:
                                                          changedDropDownGender,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SingleForm(
                                              label:
                                                  "${AppTranslations.of(context).text("gender")}",
                                              value:
                                                  "${currentGender == 'female' ? "Female" : currentGender == 'male' ? "Male" : ""}",
                                              onEdit: onEditGender,
                                            ),
                                      // emailEdit ? FormText(
                                      //   label: "${AppTranslations.of(context).text("email")}",
                                      //   hint: "${emailController.text}",
                                      //   controller: emailController
                                      // ) :
                                      SingleForm(
                                        label:
                                            "${AppTranslations.of(context).text("email")}",
                                        value: "${emailController.text}",
                                        edit: false,
                                        // onEdit: onEditEmail
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  left: 20,
                                                  right: 20,
                                                  top: 12,
                                                  bottom: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              color: Color(0xFFf1f2f6),
                                              textColor: Color(0xFF2F3542),
                                              onPressed: () =>
                                                  selectBirthDate(context),
                                              child: Container(
                                                width: screenSize.width,
                                                child: Text(
                                                    "${DateFormat('yyyy-MM-dd').format(selectedBirthDate)}",
                                                    textAlign: TextAlign.left),
                                              ),
                                            ),
                                          ]),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("place-of-birth")}",
                                        hint: "e.g. California, US.",
                                        controller: placeOfBirthController,
                                      ),
                                      FormPhone(
                                        label:
                                            "${AppTranslations.of(context).text("phone-number")}",
                                        hint: "e.g. 8123123123",
                                        controller: phoneNumberController,
                                        onChange: onCountryCodeSelect,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("job-title")}",
                                        hint:
                                            "e.g. Marketing Executive, Sales etc.",
                                        question: true,
                                        controller: jobTitleController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("country")}",
                                        hint: "e.g. United State",
                                        controller: countryController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("province")}",
                                        hint: "e.g. Washington D.C.",
                                        controller: provinceController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("city")}",
                                        hint: "e.g. California, New York",
                                        controller: cityController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("address")}",
                                        hint:
                                            "e.g. 982 Lawrence Dr. Morristown, NJ 07960",
                                        controller: addressController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("nationality")}",
                                        hint: "e.g. United State America",
                                        controller: nationalityController,
                                      ),
                                      FormText(
                                        label:
                                            "${AppTranslations.of(context).text("driving-licenses")}",
                                        hint: "...",
                                        question: true,
                                        controller: drivingLicensesController,
                                      ),
                                      SizedBox(height: 20)
                                    ],
                                  ),
                                )
                              else if (currentStep == 1)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          FormArea(
                                            label:
                                                "${AppTranslations.of(context).text("about-you")}",
                                            hint:
                                                "e.g. Passionate science teacher with 8+ years of experience and many other",
                                            question: true,
                                            minLines: 20,
                                            maxLines: 60,
                                            controller: aboutYouController,
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 2)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: employmentList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.work,
                                                value:
                                                    "${employmentList[i]['job_title']} at ${employmentList[i]['company']}",
                                                time:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(employmentList[i]['start_date']))} - ${employmentList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(employmentList[i]['end_date']))}",
                                                subvalue:
                                                    "${employmentList[i]['description']}",
                                                param1:
                                                    "${employmentList[i]['job_title']}",
                                                param2:
                                                    "${employmentList[i]['company']}",
                                                onDelete: removeEmployment,
                                              );
                                            },
                                          ),
                                          addEmployment
                                              ? Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("job-title")}",
                                                              hint:
                                                                  "e.g. Marketing Manager",
                                                              controller:
                                                                  employmentJobTitleController,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("company")}",
                                                              hint:
                                                                  "e.g. Google",
                                                              controller:
                                                                  employmentCompanyController,
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
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    "${AppTranslations.of(context).text("start-date")}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SFP_Text",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF2f3542)),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          7),
                                                                  RaisedButton(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top: 12,
                                                                        bottom:
                                                                            12),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Color(
                                                                        0xFFf1f2f6),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF2F3542),
                                                                    onPressed: () =>
                                                                        selectStartDate(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      width: screenSize
                                                                          .width,
                                                                      child: Text(
                                                                          "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                          textAlign:
                                                                              TextAlign.left),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                          SizedBox(width: 10),
                                                          employmentPresent
                                                              ? SizedBox()
                                                              : Expanded(
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          "${AppTranslations.of(context).text("end-date")}",
                                                                          style: TextStyle(
                                                                              fontFamily: "SFP_Text",
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF2f3542)),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                7),
                                                                        RaisedButton(
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20,
                                                                              top: 12,
                                                                              bottom: 12),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          color:
                                                                              Color(0xFFf1f2f6),
                                                                          textColor:
                                                                              Color(0xFF2F3542),
                                                                          onPressed: () =>
                                                                              selectEndDate(context),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                screenSize.width,
                                                                            child:
                                                                                Text("${DateFormat('MMMM yyyy').format(selectedEndDate)}", textAlign: TextAlign.left),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Checkbox(
                                                            activeColor: Color(
                                                                0xFF2f3542),
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .padded,
                                                            value:
                                                                employmentPresent,
                                                            onChanged:
                                                                (bool value) {
                                                              setState(() {
                                                                employmentPresent =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                                  '${AppTranslations.of(context).text("until-now")}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "SFP_Text",
                                                                    fontSize:
                                                                        13.3,
                                                                    color: Color(
                                                                        0xFF2f3542),
                                                                  )))
                                                        ],
                                                      ),
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("city")}",
                                                        hint:
                                                            "e.g. California, New York",
                                                        controller:
                                                            employmentCityController,
                                                      ),
                                                      FormArea(
                                                        label:
                                                            "${AppTranslations.of(context).text("description")}",
                                                        hint:
                                                            "e.g. I'am take responbilities with all of the student or employees in this company.",
                                                        minLines: 10,
                                                        maxLines: 20,
                                                        controller:
                                                            employmentDescriptionController,
                                                      )
                                                    ],
                                                  ))
                                              : Container(),
                                          addEmployment
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddEmployment(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("employment")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 3)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: educationList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.school,
                                                value:
                                                    "${educationList[i]['university']}",
                                                time:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(educationList[i]['start_date']))} - ${educationList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(educationList[i]['end_date']))}",
                                                subvalue:
                                                    "${educationList[i]['degree']}",
                                                param1:
                                                    "${educationList[i]['university']}",
                                                param2:
                                                    "${educationList[i]['degree']}",
                                                onDelete: removeEducation,
                                              );
                                            },
                                          ),
                                          addEducation
                                              ? Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("university")}",
                                                        hint:
                                                            "e.g. Oxford University",
                                                        controller:
                                                            educationUniversityController,
                                                      ),
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("degree")}",
                                                        hint:
                                                            "e.g. Management Bachelor",
                                                        controller:
                                                            educationDegreeController,
                                                      ),
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("field-of-study")}",
                                                        hint: "e.g. Bussiness",
                                                        controller:
                                                            educationFieldOfStudyController,
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    "${AppTranslations.of(context).text("start-date")}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SFP_Text",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF2f3542)),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          7),
                                                                  RaisedButton(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top: 12,
                                                                        bottom:
                                                                            12),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Color(
                                                                        0xFFf1f2f6),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF2F3542),
                                                                    onPressed: () =>
                                                                        selectStartDate(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      width: screenSize
                                                                          .width,
                                                                      child: Text(
                                                                          "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                          textAlign:
                                                                              TextAlign.left),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                          SizedBox(width: 10),
                                                          educationPresent
                                                              ? SizedBox()
                                                              : Expanded(
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          "${AppTranslations.of(context).text("end-date")}",
                                                                          style: TextStyle(
                                                                              fontFamily: "SFP_Text",
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF2f3542)),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                7),
                                                                        RaisedButton(
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20,
                                                                              top: 12,
                                                                              bottom: 12),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          color:
                                                                              Color(0xFFf1f2f6),
                                                                          textColor:
                                                                              Color(0xFF2F3542),
                                                                          onPressed: () =>
                                                                              selectEndDate(context),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                screenSize.width,
                                                                            child:
                                                                                Text("${DateFormat('MMMM yyyy').format(selectedEndDate)}", textAlign: TextAlign.left),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Checkbox(
                                                            activeColor: Color(
                                                                0xFF2f3542),
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .padded,
                                                            value:
                                                                educationPresent,
                                                            onChanged:
                                                                (bool value) {
                                                              setState(() {
                                                                educationPresent =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                                  '${AppTranslations.of(context).text("until-now")}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "SFP_Text",
                                                                    fontSize:
                                                                        13.3,
                                                                    color: Color(
                                                                        0xFF2f3542),
                                                                  )))
                                                        ],
                                                      ),
                                                      FormArea(
                                                        label:
                                                            "${AppTranslations.of(context).text("social-activities")}",
                                                        hint:
                                                            "e.g. Volleyball, Student Council",
                                                        minLines: 10,
                                                        maxLines: 20,
                                                        controller:
                                                            educationSocialActivitiesController,
                                                      ),
                                                      FormArea(
                                                        label:
                                                            "${AppTranslations.of(context).text("description")}",
                                                        hint:
                                                            "e.g. I'am take responbilities with all of the student or employees in this company.",
                                                        minLines: 10,
                                                        maxLines: 20,
                                                        controller:
                                                            educationDescriptionController,
                                                      )
                                                    ],
                                                  ))
                                              : Container(),
                                          addEducation
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddEducation(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("education-v2")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 4)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: skillsList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return ColorsList(
                                                value:
                                                    "${skillsList[i]['skill_type']}",
                                                subvalue:
                                                    "${skillsList[i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : skillsList[i]['level'] == "intermediate" ? AppTranslations.of(context).text("intermediate") : skillsList[i]['level'] == "advanced" ? AppTranslations.of(context).text("advanced") : skillsList[i]['level'] == "expert" ? AppTranslations.of(context).text("expert") : ""}",
                                                color:
                                                    colors[random.nextInt(6)],
                                                param1:
                                                    "${skillsList[i]['skill_type']}",
                                                param2:
                                                    "${skillsList[i]['level']}",
                                                onDelete: removeSkills,
                                              );
                                            },
                                          ),
                                          !addSkills
                                              ? Container()
                                              : Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        SelectSuggestion(
                                                          label:
                                                              "${AppTranslations.of(context).text("type-skill")}",
                                                          hint:
                                                              "e.g. Design Graphics",
                                                          controller:
                                                              skillsTypeSkillController,
                                                          getSuggestions:
                                                              getSuggestionSkill,
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          "${AppTranslations.of(context).text("level-skill")}",
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
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          width:
                                                              screenSize.width,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFFf1f2f6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                new DropdownButton(
                                                              value:
                                                                  selectedLevel,
                                                              items:
                                                                  dropDownMenuItems,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () => onBtnAddSkills(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("skills-v2")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 5)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                outSchoolActivitiesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.directions_run,
                                                value:
                                                    "${outSchoolActivitiesList[i]['function_title']} at ${outSchoolActivitiesList[i]['organization']}",
                                                time:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(outSchoolActivitiesList[i]['start_date']))} - ${outSchoolActivitiesList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(outSchoolActivitiesList[i]['end_date']))}",
                                                subvalue:
                                                    "${outSchoolActivitiesList[i]['description']}",
                                                param1:
                                                    "${outSchoolActivitiesList[i]['function_title']}",
                                                param2:
                                                    "${outSchoolActivitiesList[i]['organization']}",
                                                onDelete:
                                                    removeOutSchoolActivities,
                                              );
                                            },
                                          ),
                                          addOutSchoolActivities
                                              ? Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("function_title")}",
                                                              hint:
                                                                  "e.g. Chairman",
                                                              controller:
                                                                  outSchoolFunctionTitleController,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("organization")}",
                                                              hint:
                                                                  "e.g. Hacker United",
                                                              controller:
                                                                  outSchoolOrganizationController,
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
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    "${AppTranslations.of(context).text("start-date")}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SFP_Text",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF2f3542)),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          7),
                                                                  RaisedButton(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top: 12,
                                                                        bottom:
                                                                            12),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Color(
                                                                        0xFFf1f2f6),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF2F3542),
                                                                    onPressed: () =>
                                                                        selectStartDate(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      width: screenSize
                                                                          .width,
                                                                      child: Text(
                                                                          "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                          textAlign:
                                                                              TextAlign.left),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                          SizedBox(width: 10),
                                                          outSchoolPresent
                                                              ? SizedBox()
                                                              : Expanded(
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          "${AppTranslations.of(context).text("end-date")}",
                                                                          style: TextStyle(
                                                                              fontFamily: "SFP_Text",
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF2f3542)),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                7),
                                                                        RaisedButton(
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20,
                                                                              top: 12,
                                                                              bottom: 12),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          color:
                                                                              Color(0xFFf1f2f6),
                                                                          textColor:
                                                                              Color(0xFF2F3542),
                                                                          onPressed: () =>
                                                                              selectEndDate(context),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                screenSize.width,
                                                                            child:
                                                                                Text("${DateFormat('MMMM yyyy').format(selectedEndDate)}", textAlign: TextAlign.left),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Checkbox(
                                                            activeColor: Color(
                                                                0xFF2f3542),
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .padded,
                                                            value:
                                                                outSchoolPresent,
                                                            onChanged:
                                                                (bool value) {
                                                              setState(() {
                                                                outSchoolPresent =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                                  '${AppTranslations.of(context).text("until-now")}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "SFP_Text",
                                                                    fontSize:
                                                                        13.3,
                                                                    color: Color(
                                                                        0xFF2f3542),
                                                                  )))
                                                        ],
                                                      ),
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("city")}",
                                                        hint:
                                                            "e.g. California, New York",
                                                        controller:
                                                            outSchoolCityController,
                                                      ),
                                                      FormArea(
                                                        label:
                                                            "${AppTranslations.of(context).text("description")}",
                                                        hint:
                                                            "e.g. I'am take responbilities with all of the member in this organization.",
                                                        minLines: 10,
                                                        maxLines: 20,
                                                        controller:
                                                            outSchoolDescriptionController,
                                                      )
                                                    ],
                                                  ))
                                              : Container(),
                                          addOutSchoolActivities
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddOutSchool(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("out-school-activities")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 6)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: languagesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return ColorsList(
                                                value:
                                                    "${languagesList[i]['language']}",
                                                subvalue:
                                                    "${languagesList[i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : languagesList[i]['level'] == "conversational" ? AppTranslations.of(context).text("conversational") : languagesList[i]['level'] == "fluent" ? AppTranslations.of(context).text("fluent") : languagesList[i]['level'] == "native" ? AppTranslations.of(context).text("native") : ""}",
                                                color:
                                                    colors[random.nextInt(6)],
                                                param1:
                                                    "${languagesList[i]['language']}",
                                                param2:
                                                    "${languagesList[i]['level']}",
                                                onDelete: removeLanguages,
                                              );
                                            },
                                          ),
                                          !addLanguages
                                              ? Container()
                                              : Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        SelectSuggestion(
                                                          label:
                                                              "${AppTranslations.of(context).text("language")}",
                                                          hint: "e.g. English",
                                                          controller:
                                                              languageTextController,
                                                          getSuggestions:
                                                              getSuggestionLanguages,
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          "${AppTranslations.of(context).text("level-mastery")}",
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
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          width:
                                                              screenSize.width,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFFf1f2f6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                new DropdownButton(
                                                              value:
                                                                  selectedMastery,
                                                              items:
                                                                  dropDownMenuMastery,
                                                              onChanged:
                                                                  changedDropDownMastery,
                                                            ),
                                                          ),
                                                        )
                                                      ])),
                                          addLanguages
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddLanguages(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("languages")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 7)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: hobbiesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return CustomChip(
                                                "${hobbiesList[i]}",
                                                onDelete: removeHobbies,
                                              );
                                            },
                                          ),
                                          !addHobbies
                                              ? Container()
                                              : Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        SelectSuggestion(
                                                          label:
                                                              "${AppTranslations.of(context).text("hobby")}",
                                                          hint:
                                                              "e.g. Badminton",
                                                          controller:
                                                              hobbiesTextController,
                                                          getSuggestions:
                                                              getSuggestionHobbies,
                                                        ),
                                                      ])),
                                          addHobbies
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddHobbies(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("hobby")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 8)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: referencesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                image:
                                                    "${referencesList[i]['image'] ?? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"}",
                                                value:
                                                    "${referencesList[i]['fullname']}",
                                                time:
                                                    "${referencesList[i]['company']}",
                                                param1:
                                                    "${referencesList[i]['fullname']}",
                                                param2:
                                                    "${referencesList[i]['company']}",
                                                onDelete: removeReferences,
                                              );
                                            },
                                          ),
                                          !addReferences
                                              ? Container()
                                              : Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Center(
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Container(
                                                                height: 120,
                                                                width: 120,
                                                                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        0xFFf1f2f6),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: imageUrl !=
                                                                        null
                                                                    ? SizedBox(
                                                                        height:
                                                                            120,
                                                                        width:
                                                                            120,
                                                                        child: ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                            child: Image.network("$imageUrl")))
                                                                    : SizedBox(
                                                                        height:
                                                                            100,
                                                                        width:
                                                                            100,
                                                                        child: Image.asset(
                                                                            "assets/boy.png"),
                                                                      ),
                                                              ),
                                                              Positioned(
                                                                right: 5,
                                                                bottom: 5,
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child:
                                                                      RaisedButton(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    onPressed: () =>
                                                                        imageSelect(
                                                                            context),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Color(
                                                                        0xFF747d8c),
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    child: Icon(
                                                                      Icons
                                                                          .camera_alt,
                                                                      size: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 30),
                                                        Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: FormText(
                                                                label:
                                                                    "${AppTranslations.of(context).text("full-name")}",
                                                                hint:
                                                                    "e.g. John Doe",
                                                                controller:
                                                                    referencesFullnameController,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child: FormText(
                                                                label:
                                                                    "${AppTranslations.of(context).text("company")}",
                                                                hint:
                                                                    "e.g. Google",
                                                                controller:
                                                                    referencesCompanyController,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        FormText(
                                                          label:
                                                              "${AppTranslations.of(context).text("email")}",
                                                          hint:
                                                              "e.g. johndoe@gmail.com",
                                                          controller:
                                                              referencesEmailController,
                                                        ),
                                                        FormPhone(
                                                          label:
                                                              "${AppTranslations.of(context).text("phone-number")}",
                                                          hint:
                                                              "e.g. 8123123123",
                                                          controller:
                                                              referencesPhoneNumberController,
                                                          onChange:
                                                              onCountryCodeReferencesSelect,
                                                        ),
                                                        FormArea(
                                                          label:
                                                              "${AppTranslations.of(context).text("description")}",
                                                          hint:
                                                              "e.g. I'am take responbilities with all of the member in this organization.",
                                                          minLines: 10,
                                                          maxLines: 20,
                                                          controller:
                                                              referencesDescriptionController,
                                                        )
                                                      ])),
                                          addReferences
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddReferences(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("references")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 9)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: coursesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SingleList(
                                                icon: Icons.flag,
                                                value:
                                                    "${coursesList[i]['course']} at ${coursesList[i]['institution']}",
                                                time:
                                                    "${DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(coursesList[i]['start_date']))} - ${coursesList[i]['present'] ? AppTranslations.of(context).text("present") : DateFormat('MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(coursesList[i]['end_date']))}",
                                                param1:
                                                    "${coursesList[i]['course']}",
                                                param2:
                                                    "${coursesList[i]['institution']}",
                                                onDelete: removeCourse,
                                              );
                                            },
                                          ),
                                          addCourses
                                              ? Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("courses")}",
                                                              hint:
                                                                  "e.g. Javascript Website",
                                                              controller:
                                                                  coursesTextController,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: FormText(
                                                              label:
                                                                  "${AppTranslations.of(context).text("institution")}",
                                                              hint:
                                                                  "e.g. Nextbyte",
                                                              controller:
                                                                  coursesInstitutionController,
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
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    "${AppTranslations.of(context).text("start-date")}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "SFP_Text",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF2f3542)),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          7),
                                                                  RaisedButton(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top: 12,
                                                                        bottom:
                                                                            12),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Color(
                                                                        0xFFf1f2f6),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF2F3542),
                                                                    onPressed: () =>
                                                                        selectStartDate(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      width: screenSize
                                                                          .width,
                                                                      child: Text(
                                                                          "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                          textAlign:
                                                                              TextAlign.left),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                          SizedBox(width: 10),
                                                          coursesPresent
                                                              ? SizedBox()
                                                              : Expanded(
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          "${AppTranslations.of(context).text("end-date")}",
                                                                          style: TextStyle(
                                                                              fontFamily: "SFP_Text",
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF2f3542)),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                7),
                                                                        RaisedButton(
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20,
                                                                              top: 12,
                                                                              bottom: 12),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          color:
                                                                              Color(0xFFf1f2f6),
                                                                          textColor:
                                                                              Color(0xFF2F3542),
                                                                          onPressed: () =>
                                                                              selectEndDate(context),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                screenSize.width,
                                                                            child:
                                                                                Text("${DateFormat('MMMM yyyy').format(selectedEndDate)}", textAlign: TextAlign.left),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Checkbox(
                                                            activeColor: Color(
                                                                0xFF2f3542),
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .padded,
                                                            value:
                                                                coursesPresent,
                                                            onChanged:
                                                                (bool value) {
                                                              setState(() {
                                                                coursesPresent =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          Flexible(
                                                              child: Text(
                                                                  '${AppTranslations.of(context).text("until-now")}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "SFP_Text",
                                                                    fontSize:
                                                                        13.3,
                                                                    color: Color(
                                                                        0xFF2f3542),
                                                                  )))
                                                        ],
                                                      ),
                                                    ],
                                                  ))
                                              : Container(),
                                          addCourses
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () =>
                                                  onBtnAddCourses(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("courses")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ]))
                              else if (currentStep == 10)
                                Container(
                                    width: screenSize.width,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: socialList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, i) {
                                              return SocialList(
                                                type:
                                                    "${socialList[i]['type']}",
                                                value:
                                                    "${socialList[i]['link']}",
                                                onDelete: removeSocial,
                                              );
                                            },
                                          ),
                                          addSocial
                                              ? Container(
                                                  width: screenSize.width,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "${AppTranslations.of(context).text("socials")}",
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
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        width: screenSize.width,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child:
                                                              new DropdownButton(
                                                            value:
                                                                currentSocial,
                                                            items:
                                                                dropDownMenuSocial,
                                                            onChanged:
                                                                changedDropDownSocial,
                                                          ),
                                                        ),
                                                      ),
                                                      FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("link")}",
                                                        hint:
                                                            "e.g. https://github.com/arsyadsr09",
                                                        controller:
                                                            socialLinkController,
                                                      ),
                                                    ],
                                                  ))
                                              : Container(),
                                          addSocial
                                              ? SizedBox(height: 20)
                                              : SizedBox(height: 10),
                                          Center(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              onPressed: () => onBtnAddSocial(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              color: Color(0xFF2dd573),
                                              textColor: Colors.white,
                                              child: Text(
                                                "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("socials")}",
                                                style: TextStyle(
                                                    fontFamily: "SFP_Text",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
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
                              borderRadius:
                                  BorderRadiusDirectional.circular(0)),
                          onPressed: () => isLoading ? {} : changeStep(context),
                          color: Color(0xFF2dd573),
                          textColor: Colors.white,
                          child: isLoading
                              ? Center(
                                  child: Loading(
                                      indicator: BallSpinFadeLoaderIndicator(),
                                      size: 20.0))
                              : Text(
                                  currentStep < 10
                                      ? "${AppTranslations.of(context).text("next").toUpperCase()}"
                                      : "${AppTranslations.of(context).text("finish").toUpperCase()}",
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
      ),
    );
  }
}
