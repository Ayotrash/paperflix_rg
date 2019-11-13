import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/colors_list.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_area.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_phone.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_text.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/select_suggestion.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_list.dart';
import 'package:paperflix_rg/widgets/custom_chip.dart';
import 'edit_profile_view_model.dart';

class EditProfileView extends EditProfileViewModel {
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
        // backgroundColor: Color(0xFFECECEC),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Color(0xFFFAFAFA),
                title:
                    Text("${AppTranslations.of(context).text("edit-profile")}",
                        style: TextStyle(
                          fontFamily: "SFP_Text",
                        )),
              )
            ];
          },
          body: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height,
                // color: Colors.white,
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 55),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 15),
                          if (widget.type == 0)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("firstname")}",
                                    hint: "${firstnameController.text}",
                                    controller: firstnameController,
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("lastname")}",
                                    hint: "${lastnameController.text}",
                                    controller: lastnameController,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${AppTranslations.of(context).text("gender")}",
                                    style: TextStyle(
                                        fontFamily: "SFP_Text",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFf1f2f6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButtonHideUnderline(
                                      child: new DropdownButton(
                                        value: currentGender,
                                        items: dropDownMenuGender,
                                        onChanged: changedDropDownGender,
                                      ),
                                    ),
                                  ),
                                  // SingleForm(
                                  //   label:
                                  //       "${AppTranslations.of(context).text("email")}",
                                  //   value: "${emailController.text}",
                                  //   edit: false,
                                  // ),
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
                          else if (widget.type == 1)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                ],
                              ),
                            )
                          else if (widget.type == 2)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  !updateEmployment
                                      ? SizedBox(height: 15)
                                      : SizedBox(),
                                  !updateEmployment
                                      ? ListView.builder(
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
                                              param: employmentList[i]['id'],
                                              data: employmentList[i],
                                              onDelete: removeEmployment,
                                              onEdit: editEmployment,
                                            );
                                          },
                                        )
                                      : Container(),
                                  addEmployment || updateEmployment
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
                                                      hint: "e.g. Google",
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
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
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
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            textColor: Color(
                                                                0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width: screenSize
                                                                  .width,
                                                              child: Text(
                                                                  "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
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
                                                                    height: 10),
                                                                Text(
                                                                  "${AppTranslations.of(context).text("end-date")}",
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
                                                                    height: 7),
                                                                RaisedButton(
                                                                  padding: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 20,
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
                                                                  textColor: Color(
                                                                      0xFF2F3542),
                                                                  onPressed: () =>
                                                                      selectEndDate(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    width: screenSize
                                                                        .width,
                                                                    child: Text(
                                                                        "${DateFormat('MMMM yyyy').format(selectedEndDate)}",
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xFF2f3542),
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    value: employmentPresent,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        employmentPresent =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          '${AppTranslations.of(context).text("until-now")}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontSize: 13.3,
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
                                  addEmployment || updateEmployment
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateEmployment
                                          ? saveEditEmployment()
                                          : onBtnAddEmployment(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addEmployment || updateEmployment ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("employment")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 3)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  updateEducation
                                      ? SizedBox()
                                      : SizedBox(height: 15),
                                  updateEducation
                                      ? Container()
                                      : ListView.builder(
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
                                              param: educationList[i]['id'],
                                              data: educationList[i],
                                              onDelete: removeEducation,
                                              onEdit: editEducation,
                                            );
                                          },
                                        ),
                                  addEducation || updateEducation
                                      ? Container(
                                          width: screenSize.width,
                                          child: Column(
                                            children: <Widget>[
                                              FormText(
                                                label:
                                                    "${AppTranslations.of(context).text("university")}",
                                                hint: "e.g. Oxford University",
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
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
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
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            textColor: Color(
                                                                0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width: screenSize
                                                                  .width,
                                                              child: Text(
                                                                  "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
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
                                                                    height: 10),
                                                                Text(
                                                                  "${AppTranslations.of(context).text("end-date")}",
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
                                                                    height: 7),
                                                                RaisedButton(
                                                                  padding: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 20,
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
                                                                  textColor: Color(
                                                                      0xFF2F3542),
                                                                  onPressed: () =>
                                                                      selectEndDate(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    width: screenSize
                                                                        .width,
                                                                    child: Text(
                                                                        "${DateFormat('MMMM yyyy').format(selectedEndDate)}",
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xFF2f3542),
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    value: educationPresent,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        educationPresent =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          '${AppTranslations.of(context).text("until-now")}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontSize: 13.3,
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
                                  addEducation || updateEducation
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateEducation
                                          ? saveEditEducation()
                                          : onBtnAddEducation(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addEducation || updateEducation ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("education-v2")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 4)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: skillsList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return ColorsList(
                                        value: "${skillsList[i]['skill_type']}",
                                        subvalue:
                                            "${skillsList[i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : skillsList[i]['level'] == "intermediate" ? AppTranslations.of(context).text("intermediate") : skillsList[i]['level'] == "advanced" ? AppTranslations.of(context).text("advanced") : skillsList[i]['level'] == "expert" ? AppTranslations.of(context).text("expert") : ""}",
                                        color: colors[random.nextInt(6)],
                                        param: skillsList[i]['id'],
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
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SelectSuggestion(
                                                  label:
                                                      "${AppTranslations.of(context).text("type-skill")}",
                                                  hint: "e.g. Design Graphics",
                                                  controller:
                                                      skillsTypeSkillController,
                                                  getSuggestions:
                                                      getSuggestionSkill,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "${AppTranslations.of(context).text("level-skill")}",
                                                  style: TextStyle(
                                                      fontFamily: "SFP_Text",
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddSkills(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addSkills ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("skills-v2")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 5)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  updateOutSchoolActivities
                                      ? SizedBox()
                                      : SizedBox(height: 15),
                                  updateOutSchoolActivities
                                      ? SizedBox()
                                      : ListView.builder(
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
                                              param: outSchoolActivitiesList[i]
                                                  ['id'],
                                              data: outSchoolActivitiesList[i],
                                              onDelete:
                                                  removeOutSchoolActivities,
                                              onEdit: editOutSchoolActivities,
                                            );
                                          },
                                        ),
                                  addOutSchoolActivities ||
                                          updateOutSchoolActivities
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
                                                      hint: "e.g. Chairman",
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
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
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
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            textColor: Color(
                                                                0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width: screenSize
                                                                  .width,
                                                              child: Text(
                                                                  "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
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
                                                                    height: 10),
                                                                Text(
                                                                  "${AppTranslations.of(context).text("end-date")}",
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
                                                                    height: 7),
                                                                RaisedButton(
                                                                  padding: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 20,
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
                                                                  textColor: Color(
                                                                      0xFF2F3542),
                                                                  onPressed: () =>
                                                                      selectEndDate(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    width: screenSize
                                                                        .width,
                                                                    child: Text(
                                                                        "${DateFormat('MMMM yyyy').format(selectedEndDate)}",
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xFF2f3542),
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    value: outSchoolPresent,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        outSchoolPresent =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          '${AppTranslations.of(context).text("until-now")}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontSize: 13.3,
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
                                  addOutSchoolActivities ||
                                          updateOutSchoolActivities
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateOutSchoolActivities
                                          ? saveEditOutSchoolActivities()
                                          : onBtnAddOutSchool(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addOutSchoolActivities || updateOutSchoolActivities ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("out-school-activities")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 6)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: languagesList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return ColorsList(
                                        value:
                                            "${languagesList[i]['language']}",
                                        subvalue:
                                            "${languagesList[i]['level'] == "beginner" ? AppTranslations.of(context).text("beginner") : languagesList[i]['level'] == "conversational" ? AppTranslations.of(context).text("conversational") : languagesList[i]['level'] == "fluent" ? AppTranslations.of(context).text("fluent") : languagesList[i]['level'] == "native" ? AppTranslations.of(context).text("native") : ""}",
                                        color: colors[random.nextInt(6)],
                                        param: languagesList[i]['id'],
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
                                                  CrossAxisAlignment.start,
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
                                                      fontFamily: "SFP_Text",
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                      value: selectedMastery,
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
                                              BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddLanguages(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addLanguages ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("languages")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 7)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: hobbiesList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return CustomChip(
                                        "${hobbiesList[i]}",
                                        expand: true,
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
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SelectSuggestion(
                                                  label:
                                                      "${AppTranslations.of(context).text("hobby")}",
                                                  hint: "e.g. Badminton",
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
                                              BorderRadius.circular(30)),
                                      onPressed: () => onBtnAddHobbies(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addHobbies ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("hobby")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 8)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  updateReferences
                                      ? SizedBox()
                                      : SizedBox(height: 15),
                                  updateReferences
                                      ? SizedBox()
                                      : ListView.builder(
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
                                              param: referencesList[i]['id'],
                                              data: referencesList[i],
                                              onDelete: removeReferences,
                                              onEdit: editReferences,
                                            );
                                          },
                                        ),
                                  addReferences || updateReferences
                                      ? Container(
                                          width: screenSize.width,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: imageUrl != null
                                                            ? SizedBox(
                                                                height: 120,
                                                                width: 120,
                                                                child: ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child: Image
                                                                        .network(
                                                                            "$imageUrl")))
                                                            : SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child: Image.asset(
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
                                                            padding:
                                                                EdgeInsets.zero,
                                                            onPressed: () =>
                                                                imageSelect(
                                                                    context),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            color: Color(
                                                                0xFF747d8c),
                                                            textColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons.camera_alt,
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
                                                        hint: "e.g. John Doe",
                                                        controller:
                                                            referencesFullnameController,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: FormText(
                                                        label:
                                                            "${AppTranslations.of(context).text("company")}",
                                                        hint: "e.g. Google",
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
                                                  hint: "e.g. 8123123123",
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
                                              ]))
                                      : Container(),
                                  addReferences || updateReferences
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateReferences
                                          ? saveEditReferences()
                                          : onBtnAddReferences(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addReferences || updateReferences ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("references")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 9)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  updateCourses
                                      ? SizedBox()
                                      : SizedBox(height: 15),
                                  updateCourses
                                      ? SizedBox()
                                      : ListView.builder(
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
                                              param: coursesList[i]['id'],
                                              data: coursesList[i],
                                              onDelete: removeCourse,
                                              onEdit: editCourse,
                                            );
                                          },
                                        ),
                                  addCourses || updateCourses
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
                                                      hint: "e.g. Nextbyte",
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
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
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
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            textColor: Color(
                                                                0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width: screenSize
                                                                  .width,
                                                              child: Text(
                                                                  "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
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
                                                                    height: 10),
                                                                Text(
                                                                  "${AppTranslations.of(context).text("end-date")}",
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
                                                                    height: 7),
                                                                RaisedButton(
                                                                  padding: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 20,
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
                                                                  textColor: Color(
                                                                      0xFF2F3542),
                                                                  onPressed: () =>
                                                                      selectEndDate(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    width: screenSize
                                                                        .width,
                                                                    child: Text(
                                                                        "${DateFormat('MMMM yyyy').format(selectedEndDate)}",
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xFF2f3542),
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    value: coursesPresent,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        coursesPresent = value;
                                                      });
                                                    },
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          '${AppTranslations.of(context).text("until-now")}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontSize: 13.3,
                                                            color: Color(
                                                                0xFF2f3542),
                                                          )))
                                                ],
                                              ),
                                            ],
                                          ))
                                      : Container(),
                                  addCourses || updateCourses
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateCourses
                                          ? saveEditCourse()
                                          : onBtnAddCourses(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addCourses || updateCourses ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("courses")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                          else if (widget.type == 10)
                            Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  updateCourses
                                      ? SizedBox()
                                      : SizedBox(height: 15),
                                  updateCourses
                                      ? SizedBox()
                                      : ListView.builder(
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
                                              param: coursesList[i]['id'],
                                              data: coursesList[i],
                                              onDelete: removeCourse,
                                              onEdit: editCourse,
                                            );
                                          },
                                        ),
                                  addCourses || updateCourses
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
                                                      hint: "e.g. Nextbyte",
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
                                                        children: <Widget>[
                                                          SizedBox(height: 10),
                                                          Text(
                                                            "${AppTranslations.of(context).text("start-date")}",
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
                                                            color: Color(
                                                                0xFFf1f2f6),
                                                            textColor: Color(
                                                                0xFF2F3542),
                                                            onPressed: () =>
                                                                selectStartDate(
                                                                    context),
                                                            child: Container(
                                                              width: screenSize
                                                                  .width,
                                                              child: Text(
                                                                  "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
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
                                                                    height: 10),
                                                                Text(
                                                                  "${AppTranslations.of(context).text("end-date")}",
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
                                                                    height: 7),
                                                                RaisedButton(
                                                                  padding: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 20,
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
                                                                  textColor: Color(
                                                                      0xFF2F3542),
                                                                  onPressed: () =>
                                                                      selectEndDate(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    width: screenSize
                                                                        .width,
                                                                    child: Text(
                                                                        "${DateFormat('MMMM yyyy').format(selectedEndDate)}",
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xFF2f3542),
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    value: coursesPresent,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        coursesPresent = value;
                                                      });
                                                    },
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          '${AppTranslations.of(context).text("until-now")}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SFP_Text",
                                                            fontSize: 13.3,
                                                            color: Color(
                                                                0xFF2f3542),
                                                          )))
                                                ],
                                              ),
                                            ],
                                          ))
                                      : Container(),
                                  addCourses || updateCourses
                                      ? SizedBox(height: 20)
                                      : SizedBox(height: 10),
                                  Center(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () => updateCourses
                                          ? saveEditCourse()
                                          : onBtnAddCourses(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      color: Color(0xFF2dd573),
                                      textColor: Colors.white,
                                      child: Text(
                                        "+ ${addCourses || updateCourses ? AppTranslations.of(context).text("save") : AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("courses")}",
                                        style: TextStyle(
                                            fontFamily: "SFP_Text",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            )
                        ])),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 50,
                  width: screenSize.width,
                  child: RaisedButton(
                    onPressed: () => uploadData(),
                    color: Color(0xFF2dd573),
                    textColor: Colors.white,
                    child: Text(
                      "${AppTranslations.of(context).text("finish").toUpperCase()}",
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
      ),
    );
  }
}
