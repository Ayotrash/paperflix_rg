import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'edit_profile.dart';

abstract class EditProfileViewModel extends State<EditProfile> {
  final db = Firestore.instance;
  var uuid = new Uuid();
  File image;
  String imageUrl;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController drivingLicensesController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();

  TextEditingController employmentJobTitleController = TextEditingController();
  TextEditingController employmentCompanyController = TextEditingController();
  TextEditingController employmentCityController = TextEditingController();
  TextEditingController employmentDescriptionController =
      TextEditingController();

  TextEditingController outSchoolFunctionTitleController =
      TextEditingController();
  TextEditingController outSchoolOrganizationController =
      TextEditingController();
  TextEditingController outSchoolCityController = TextEditingController();
  TextEditingController outSchoolDescriptionController =
      TextEditingController();

  TextEditingController educationUniversityController = TextEditingController();
  TextEditingController educationDegreeController = TextEditingController();
  TextEditingController educationFieldOfStudyController =
      TextEditingController();
  TextEditingController educationSocialActivitiesController =
      TextEditingController();
  TextEditingController educationDescriptionController =
      TextEditingController();

  TextEditingController coursesTextController = TextEditingController();
  TextEditingController coursesInstitutionController = TextEditingController();

  TextEditingController referencesFullnameController = TextEditingController();
  TextEditingController referencesCompanyController = TextEditingController();
  TextEditingController referencesEmailController = TextEditingController();
  TextEditingController referencesPhoneNumberController =
      TextEditingController();
  TextEditingController referencesDescriptionController =
      TextEditingController();

  TextEditingController skillsTypeSkillController = TextEditingController();

  TextEditingController languageTextController = TextEditingController();

  TextEditingController hobbiesTextController = TextEditingController();

  TextEditingController socialLinkController = TextEditingController();

  DateTime selectedBirthDate = DateTime(DateTime.now().year - 1);
  DateTime selectedStartDate = DateTime(2019);
  DateTime selectedEndDate = DateTime(2019);

  bool isLoading = false;
  bool addEmployment = false;
  bool addEducation = false;
  bool addCourses = false;
  bool addReferences = false;
  bool addSkills = false;
  bool addLanguages = false;
  bool addOutSchoolActivities = false;
  bool addHobbies = false;
  bool addSocial = false;
  bool fullnameEdit = false;
  bool genderEdit = false;
  // bool emailEdit = false;
  bool employmentPresent = false;
  bool outSchoolPresent = false;
  bool educationPresent = false;
  bool coursesPresent = false;

  bool updateEmployment = false;
  bool updateEducation = false;
  bool updateOutSchoolActivities = false;
  bool updateReferences = false;
  bool updateCourses = false;

  Map dataEmployment = Map();
  Map dataEducation = Map();
  Map dataOutSchoolActivities = Map();
  Map dataReferences = Map();
  Map dataCourses = Map();

  List levelSkills = [
    {"id": "beginner", "text": "Beginner"},
    {"id": "intermediate", "text": "Intermediate"},
    {"id": "advanced", "text": "Advanced"},
    {"id": "expert", "text": "Expert"},
  ];

  List levelMastery = [
    {"id": "beginner", "text": "Beginner"},
    {"id": "conversational", "text": "Conversational"},
    {"id": "fluent", "text": "Fluent"},
    {"id": "native", "text": "Native"},
  ];

  List typeSocial = [
    {"id": "facebook", "text": "Facebook"},
    {"id": "instagram", "text": "Instagram"},
    {"id": "github", "text": "Github"},
    {"id": "googleplus", "text": "Google Plus"},
    {"id": "linkedin", "text": "Linkedin"},
  ];

  List genders = [
    {"id": "female", "text": "Female"},
    {"id": "male", "text": "Male"},
  ];
  List employmentList = List();
  List educationList = List();
  List referencesList = List();
  List skillsList = List();
  List languagesList = List();
  List outSchoolActivitiesList = List();
  List hobbiesList = List();
  List coursesList = List();
  List socialList = List();

  List<String> typeSkills = List();
  List<String> languages = List();
  List<String> hobbies = List();

  List colors = [
    0xFFff4757,
    0xFF2ed573,
    0xFFffa502,
    0xFFff6b81,
    0xFF1e90ff,
    0xFF3742fa
  ];

  Random random = new Random();

  List<DropdownMenuItem<String>> dropDownMenuItems;
  List<DropdownMenuItem<String>> dropDownMenuMastery;
  List<DropdownMenuItem<String>> dropDownMenuSocial;
  List<DropdownMenuItem<String>> dropDownMenuGender;
  String selectedLevel = "beginner";
  String selectedMastery = "beginner";
  String currentSocial = "facebook";
  String currentGender = 'female';
  String currentCountryCode;

  void onCountryCodeSelect(code) {
    setState(() {
      currentCountryCode = code;
    });
  }

  String currentCountryCodePreferences;

  void onCountryCodeReferencesSelect(code) {
    setState(() {
      currentCountryCodePreferences = code;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuGender() {
    List<DropdownMenuItem<String>> items = new List();
    for (Map gender in genders) {
      items.add(new DropdownMenuItem(
          value: gender['id'],
          child: new Text(
            gender['text'],
            style: TextStyle(
              color: Color(0xFF2f3542),
              fontSize: 13,
            ),
          )));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownMenuSocial() {
    List<DropdownMenuItem<String>> items = new List();
    for (Map social in typeSocial) {
      items.add(new DropdownMenuItem(
          value: social['id'],
          child: new Text(
            social['text'],
            style: TextStyle(
              color: Color(0xFF2f3542),
              fontSize: 13,
            ),
          )));
    }
    return items;
  }

  List<String> getSuggestionSkill(String query) {
    List<String> matches = List();
    matches.addAll(typeSkills);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> getSuggestionLanguages(String query) {
    List<String> matches = List();
    matches.addAll(languages);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> getSuggestionHobbies(String query) {
    List<String> matches = List();
    matches.addAll(hobbies);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  void toggleLoading(value) {
    if (this.mounted) {
      setState(() {
        isLoading = value;
      });
    }
  }

  void changedDropDownGender(String selectedGender) {
    setState(() {
      currentGender = selectedGender;
    });
  }

  void changedDropDownSocial(String selectedSocial) {
    setState(() {
      currentSocial = selectedSocial;
    });
  }

  void toastMsg(String message) {
    Toast.show("$message", context,
        backgroundColor: Color(0xFF747d8c),
        textColor: Colors.white,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
  }

  void removeEmployment(id) {
    setState(() {
      employmentList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Employment Success");
  }

  void removeOutSchoolActivities(id) {
    setState(() {
      outSchoolActivitiesList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Out School Activities Success");
  }

  void removeEducation(id) {
    setState(() {
      educationList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Education Success");
  }

  void removeCourse(id) {
    setState(() {
      coursesList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Course Success");
  }

  void removeReferences(id) {
    setState(() {
      referencesList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Reference Success");
  }

  void removeSkills(id) {
    setState(() {
      skillsList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Skill Success");
  }

  void removeLanguages(id) {
    setState(() {
      languagesList.removeWhere((item) => item['id'] == id);
    });
    toastMsg("Delete Language Success");
  }

  void removeSocial(type) {
    setState(() {
      socialList.removeWhere((item) => item['type'] == type);
    });
    toastMsg("Delete Social Success");
  }

  void removeHobbies(hobby) {
    setState(() {
      hobbiesList.removeWhere((item) => item == hobby);
    });
    toastMsg("Delete Hobby Success");
  }

  Future<void> onEditFullname() async {
    setState(() {
      fullnameEdit = !fullnameEdit;
    });
    print("fullnameEdit : $fullnameEdit");
  }

  Future<void> onEditGender() async {
    setState(() {
      genderEdit = !genderEdit;
    });
    print("genderEdit : $genderEdit");
  }

  // Future<void> onEditEmail() async {
  //   setState(() {
  //     emailEdit = !emailEdit;
  //   });
  //   print(this.widget.email);
  //   print("emailEdit : $emailEdit");
  // }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (Map level in levelSkills) {
      items.add(new DropdownMenuItem(
          value: level['id'],
          child: new Text(
            level['text'],
            style: TextStyle(
                color: Color(0xFF2f3542), fontWeight: FontWeight.bold),
          )));
    }
    return items;
  }

  void changedDropDownItem(String _selectedLevel) {
    setState(() {
      selectedLevel = _selectedLevel;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuMastery() {
    List<DropdownMenuItem<String>> items = new List();
    for (Map level in levelMastery) {
      items.add(new DropdownMenuItem(
          value: level['id'],
          child: new Text(
            level['text'],
            style: TextStyle(
                color: Color(0xFF2f3542), fontWeight: FontWeight.bold),
          )));
    }
    return items;
  }

  void changedDropDownMastery(String _selectedLevel) {
    setState(() {
      selectedMastery = _selectedLevel;
    });
  }

  Future<Null> selectBirthDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedBirthDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(DateTime.now().year - 1));
    if (picked != null && picked != selectedBirthDate)
      setState(() {
        selectedBirthDate = picked;
      });
  }

  Future<Null> selectStartDate(BuildContext context) async {
    showMonthPicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
            initialDate: DateTime(2019, 1))
        .then((date) {
      if (date != null) {
        print("date $date");
        setState(() {
          selectedStartDate = date;
        });
      }
    }).catchError((err) => print(err));
  }

  Future<Null> selectEndDate(BuildContext context) async {
    showMonthPicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
            initialDate: DateTime(2019, 1))
        .then((date) {
      if (date != null) {
        print("date $date");
        setState(() {
          selectedEndDate = date;
        });
      }
    }).catchError((err) => print(err));
  }

  void onBtnAddEmployment() {
    if (!addEmployment) {
      setState(() {
        addEmployment = true;
      });
      print(addEmployment);
    } else {
      if (employmentJobTitleController.text.length > 0 &&
          employmentCompanyController.text.length > 0 &&
          employmentCityController.text.length > 0 &&
          employmentDescriptionController.text.length > 0) {
        Map _employmentTemp = {
          "id": uuid.v1(),
          "job_title": "${employmentJobTitleController.text}",
          "company": "${employmentCompanyController.text}",
          "city": "${employmentCityController.text}",
          "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
          "end_date": employmentPresent
              ? null
              : selectedEndDate.millisecondsSinceEpoch ?? null,
          "present": employmentPresent,
          "description": "${employmentDescriptionController.text}",
        };

        setState(() {
          employmentJobTitleController.text = "";
          employmentCompanyController.text = "";
          employmentCityController.text = "";
          employmentDescriptionController.text = "";
          employmentList.add(_employmentTemp);
          addEmployment = false;
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          employmentPresent = false;
        });
        print(employmentList);
      } else {
        toastMsg("You must fill all the fields");
      }
    }
  }

  void onBtnAddOutSchool() {
    if (!addOutSchoolActivities) {
      setState(() {
        addOutSchoolActivities = true;
      });
      print(addOutSchoolActivities);
    } else {
      if (outSchoolFunctionTitleController.text.length > 0 &&
          outSchoolOrganizationController.text.length > 0 &&
          outSchoolCityController.text.length > 0 &&
          outSchoolDescriptionController.text.length > 0) {
        Map _outSchoolTemp = {
          "id": uuid.v1(),
          "function_title": "${outSchoolFunctionTitleController.text}",
          "organization": "${outSchoolOrganizationController.text}",
          "city": "${outSchoolCityController.text}",
          "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
          "end_date": outSchoolPresent
              ? null
              : selectedEndDate.millisecondsSinceEpoch ?? null,
          "present": outSchoolPresent,
          "description": "${outSchoolDescriptionController.text}",
        };

        setState(() {
          outSchoolFunctionTitleController.text = "";
          outSchoolOrganizationController.text = "";
          outSchoolCityController.text = "";
          outSchoolDescriptionController.text = "";
          outSchoolActivitiesList.add(_outSchoolTemp);
          addOutSchoolActivities = false;
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          outSchoolPresent = false;
        });
        print(outSchoolActivitiesList);
      } else {
        toastMsg("You must fill all the fields");
      }
    }
  }

  void onBtnAddEducation() {
    if (!addEducation) {
      setState(() {
        addEducation = true;
      });
      print(addEducation);
    } else {
      if (educationUniversityController.text.length > 0 &&
          educationDegreeController.text.length > 0 &&
          educationFieldOfStudyController.text.length > 0 &&
          educationSocialActivitiesController.text.length > 0 &&
          educationDescriptionController.text.length > 0) {
        Map _educationTemp = {
          "id": uuid.v1(),
          "university": "${educationUniversityController.text}",
          "degree": "${educationDegreeController.text}",
          "field_of_study": "${educationFieldOfStudyController.text}",
          "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
          "end_date": educationPresent
              ? null
              : selectedEndDate.millisecondsSinceEpoch ?? null,
          "present": educationPresent,
          "education_social_activities":
              "${educationSocialActivitiesController.text}",
          "description": "${educationDescriptionController.text}",
        };

        setState(() {
          educationUniversityController.text = "";
          educationDegreeController.text = "";
          educationFieldOfStudyController.text = "";
          educationSocialActivitiesController.text = "";
          educationDescriptionController.text = "";
          educationList.add(_educationTemp);
          addEducation = false;
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          educationPresent = false;
        });
        print(educationList);
      } else {
        toastMsg("You must fill all the fields");
      }
    }
  }

  void onBtnAddReferences() {
    if (!addReferences) {
      setState(() {
        addReferences = true;
      });
      print(addReferences);
    } else {
      if (referencesFullnameController.text.length > 0 &&
          referencesCompanyController.text.length > 0 &&
          referencesEmailController.text.length > 0 &&
          referencesPhoneNumberController.text.length > 0 &&
          referencesDescriptionController.text.length > 0) {
        Map _referencesTemp = {
          "id": uuid.v1(),
          "fullname": "${referencesFullnameController.text}",
          "company": "${referencesCompanyController.text}",
          "email": "${referencesEmailController.text}",
          "image":
              "${imageUrl ?? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"}",
          "phone": "${referencesPhoneNumberController.text}",
          "country_code": "$currentCountryCodePreferences",
          "description": "${referencesDescriptionController.text}",
        };

        setState(() {
          referencesFullnameController.text = "";
          referencesCompanyController.text = "";
          referencesEmailController.text = "";
          referencesPhoneNumberController.text = "";
          referencesDescriptionController.text = "";
          referencesList.add(_referencesTemp);
          addReferences = false;
        });
        print(referencesList);
      } else {
        toastMsg("You must fill all the fields");
      }
    }
  }

  void onBtnAddCourses() {
    if (!addCourses) {
      setState(() {
        addCourses = true;
      });
      print(addCourses);
    } else {
      if (coursesTextController.text.length > 0 &&
          coursesInstitutionController.text.length > 0) {
        Map _coursesTemp = {
          "id": uuid.v1(),
          "course": "${coursesTextController.text}",
          "institution": "${coursesInstitutionController.text}",
          "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
          "end_date": coursesPresent
              ? null
              : selectedEndDate.millisecondsSinceEpoch ?? null,
          "present": coursesPresent,
        };

        setState(() {
          coursesTextController.text = "";
          coursesInstitutionController.text = "";
          coursesList.add(_coursesTemp);
          addCourses = false;
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          coursesPresent = false;
        });
        print(referencesList);
      } else {
        toastMsg("You must fill all the fields");
      }
    }
  }

  void onBtnAddSkills() {
    Map _skill = {
      "id": uuid.v1(),
      "skill_type": "${skillsTypeSkillController.text}",
      "level": "$selectedLevel"
    };
    if (!addSkills) {
      setState(() {
        addSkills = true;
      });
    } else {
      if (skillsList.toString().contains(_skill['skill_type'].toString())) {
        toastMsg("${skillsTypeSkillController.text} already in your skills.");
      } else {
        if (skillsTypeSkillController.text.length > 0 &&
            selectedLevel.length > 0) {
          setState(() {
            skillsList.add(_skill);
            skillsTypeSkillController.text = "";
            selectedLevel = dropDownMenuItems[0].value;
            addSkills = false;
          });
          print(skillsList);
        }
      }
    }
  }

  void onBtnAddLanguages() {
    Map _language = {
      "id": uuid.v1(),
      "language": "${languageTextController.text}",
      "level": "$selectedMastery"
    };
    if (!addLanguages) {
      setState(() {
        addLanguages = true;
      });
    } else {
      if (languagesList.toString().contains(_language['language'].toString())) {
        toastMsg("${languageTextController.text} already in your languages.");
      } else {
        if (languageTextController.text.length > 0 &&
            selectedMastery.length > 0) {
          setState(() {
            languagesList.add(_language);
            languageTextController.text = "";
            selectedLevel = dropDownMenuMastery[0].value;
            addLanguages = false;
          });
          print(languagesList);
        }
      }
    }
  }

  void onBtnAddSocial() {
    Map _social = {
      "type": "$currentSocial",
      "link": "${socialLinkController.text}"
    };
    print(_social);
    if (!addSocial) {
      setState(() {
        addSocial = true;
      });
    } else {
      if (socialList.toString().contains(_social['type'].toString())) {
        toastMsg(
            "${_social['type'][0].toUpperCase()}${_social['type'].substring(1)} already in your social.");
      } else {
        if (socialLinkController.text.length > 0 && currentSocial.length > 0) {
          setState(() {
            socialList.add(_social);
            socialLinkController.text = "";
            currentSocial = dropDownMenuSocial[0].value;
            addSocial = false;
          });
          print(socialList);
        }
      }
    }
  }

  void onBtnAddHobbies() {
    String _hobby = "${hobbiesTextController.text}";
    if (!addHobbies) {
      setState(() {
        addHobbies = true;
      });
    } else {
      if (hobbiesList.contains(hobbiesTextController.text)) {
        toastMsg("${hobbiesTextController.text} already in your Hobbies.");
      } else {
        if (hobbiesTextController.text.length > 0) {
          setState(() {
            hobbiesList.add(_hobby);
            hobbiesTextController.text = "";
            selectedLevel = dropDownMenuItems[0].value;
            addHobbies = false;
          });
          print(hobbiesList);
        }
      }
    }
  }

  void editEmployment(data) {
    setState(() {
      updateEmployment = true;
      dataEmployment = data;
      employmentJobTitleController.text = "${data['job_title']}";
      employmentCompanyController.text = "${data['company']}";
      employmentCityController.text = "${data['city']}";
      employmentDescriptionController.text = "${data['description']}";
      selectedStartDate =
          DateTime.fromMillisecondsSinceEpoch(data['start_date']);
      employmentPresent = data['present'];
      selectedEndDate = data['present']
          ? DateTime(2019)
          : DateTime.fromMillisecondsSinceEpoch(data['end_date']);
    });
  }

  void saveEditEmployment() {
    if (employmentJobTitleController.text.length > 0 &&
        employmentCompanyController.text.length > 0 &&
        employmentCityController.text.length > 0 &&
        employmentDescriptionController.text.length > 0) {
      setState(() {
        employmentList.forEach((item) {
          if (item['id'] == dataEmployment['id']) {
            Map _employmentTemp = {
              "id": item['id'],
              "job_title": "${employmentJobTitleController.text}",
              "company": "${employmentCompanyController.text}",
              "city": "${employmentCityController.text}",
              "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
              "end_date": employmentPresent
                  ? null
                  : selectedEndDate.millisecondsSinceEpoch ?? null,
              "present": employmentPresent,
              "description": "${employmentDescriptionController.text}",
            };
            employmentList.remove(item);
            employmentList.add(_employmentTemp);
          }
        });
        updateEmployment = false;
        dataEmployment = Map();
      });
      print(employmentList);
    }
  }

  void editEducation(data) {
    setState(() {
      updateEducation = true;
      dataEducation = data;
      educationUniversityController.text = "${data['university']}";
      educationDegreeController.text = "${data['degree']}";
      educationFieldOfStudyController.text = "${data['field_of_study']}";
      educationDescriptionController.text = "${data['description']}";
      educationSocialActivitiesController.text =
          "${data['education_social_activities']}";
      selectedStartDate =
          DateTime.fromMillisecondsSinceEpoch(data['start_date']);
      selectedEndDate = data['present']
          ? DateTime(2019)
          : DateTime.fromMillisecondsSinceEpoch(data['end_date']);
      educationPresent = data['present'];
    });
  }

  void saveEditEducation() {
    if (educationUniversityController.text.length > 0 &&
        educationDegreeController.text.length > 0 &&
        educationFieldOfStudyController.text.length > 0 &&
        educationSocialActivitiesController.text.length > 0 &&
        educationDescriptionController.text.length > 0) {
      setState(() {
        educationList.forEach((item) {
          if (item['id'] == dataEducation['id']) {
            Map _educationTemp = {
              "id": item['id'],
              "university": "${educationUniversityController.text}",
              "degree": "${educationDegreeController.text}",
              "field_of_study": "${educationFieldOfStudyController.text}",
              "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
              "end_date": educationPresent
                  ? null
                  : selectedEndDate.millisecondsSinceEpoch ?? null,
              "present": educationPresent,
              "education_social_activities":
                  "${educationSocialActivitiesController.text}",
              "description": "${educationDescriptionController.text}",
            };
            educationList.remove(item);
            educationList.add(_educationTemp);
          }
        });
        updateEducation = false;
        dataEducation = Map();
      });
      print(educationList);
    }
  }

  void editOutSchoolActivities(data) {
    setState(() {
      updateOutSchoolActivities = true;
      dataOutSchoolActivities = data;
      outSchoolFunctionTitleController.text = "${data['function_title']}";
      outSchoolOrganizationController.text = "${data['organization']}";
      outSchoolCityController.text = "${data['city']}";
      outSchoolDescriptionController.text = "${data['description']}";
      selectedStartDate =
          DateTime.fromMillisecondsSinceEpoch(data['start_date']);
      selectedEndDate = data['present']
          ? DateTime(2019)
          : DateTime.fromMillisecondsSinceEpoch(data['end_date']);
      outSchoolPresent = data['present'];
    });
  }

  void saveEditOutSchoolActivities() {
    if (outSchoolFunctionTitleController.text.length > 0 &&
        outSchoolOrganizationController.text.length > 0 &&
        outSchoolCityController.text.length > 0 &&
        outSchoolDescriptionController.text.length > 0) {
      setState(() {
        outSchoolActivitiesList.forEach((item) {
          if (item['id'] == dataOutSchoolActivities['id']) {
            Map _outSchoolTemp = {
              "id": item['id'],
              "function_title": "${outSchoolFunctionTitleController.text}",
              "organization": "${outSchoolOrganizationController.text}",
              "city": "${outSchoolCityController.text}",
              "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
              "end_date": outSchoolPresent
                  ? null
                  : selectedEndDate.millisecondsSinceEpoch ?? null,
              "present": outSchoolPresent,
              "description": "${outSchoolDescriptionController.text}",
            };
            outSchoolActivitiesList.remove(item);
            outSchoolActivitiesList.add(_outSchoolTemp);
          }
        });
        updateOutSchoolActivities = false;
        dataOutSchoolActivities = Map();
      });
      print(outSchoolActivitiesList);
    }
  }

  void editReferences(data) {
    setState(() {
      updateReferences = true;
      dataReferences = data;
      referencesFullnameController.text = "${data['fullname']}";
      referencesCompanyController.text = "${data['company']}";
      referencesEmailController.text = "${data['email']}";
      referencesPhoneNumberController.text = "${data['phone']}";
      referencesDescriptionController.text = "${data['description']}";
      imageUrl = "${data['image']}";
    });
  }

  void saveEditReferences() {
    if (referencesFullnameController.text.length > 0 &&
        referencesCompanyController.text.length > 0 &&
        referencesEmailController.text.length > 0 &&
        referencesPhoneNumberController.text.length > 0 &&
        referencesDescriptionController.text.length > 0) {
      setState(() {
        referencesList.forEach((item) {
          if (item['id'] == dataReferences['id']) {
            Map _referencesTemp = {
              "id": item['id'],
              "fullname": "${referencesFullnameController.text}",
              "company": "${referencesCompanyController.text}",
              "email": "${referencesEmailController.text}",
              "image":
                  "${imageUrl ?? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"}",
              "phone": "${referencesPhoneNumberController.text}",
              "description": "${referencesDescriptionController.text}",
            };
            referencesList.remove(item);
            referencesList.add(_referencesTemp);
          }
        });
        updateReferences = false;
        dataReferences = Map();
      });
      print(referencesList);
    }
  }

  void editCourse(data) {
    setState(() {
      updateCourses = true;
      dataCourses = data;
      coursesTextController.text = "${data['course']}";
      coursesInstitutionController.text = "${data['institution']}";
      selectedStartDate =
          DateTime.fromMillisecondsSinceEpoch(data['start_date']);
      selectedEndDate = data['present']
          ? DateTime(2019)
          : DateTime.fromMillisecondsSinceEpoch(data['end_date']);
      coursesPresent = data['present'];
    });
  }

  void saveEditCourse() {
    if (coursesTextController.text.length > 0 &&
        coursesInstitutionController.text.length > 0) {
      setState(() {
        coursesList.forEach((item) {
          if (item['id'] == dataCourses['id']) {
            Map _coursesTemp = {
              "id": item['id'],
              "course": "${coursesTextController.text}",
              "institution": "${coursesInstitutionController.text}",
              "start_date": selectedStartDate.millisecondsSinceEpoch ?? null,
              "end_date": coursesPresent
                  ? null
                  : selectedEndDate.millisecondsSinceEpoch ?? null,
              "present": coursesPresent,
            };
            coursesList.remove(item);
            coursesList.add(_coursesTemp);
          }
        });
        updateCourses = false;
        dataCourses = Map();
      });
      print(coursesList);
    }
  }

  // void skipStep(_context) {
  //   if (currentStep < 4) {
  //     moveNext();
  //     setState(() {
  //       currentStep++;
  //     });
  //   } else {
  //     print("Current Step : (5) Max");
  //     willNextDialog(0, _context);
  //   }
  // }

  Future willPopDialog(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('${AppTranslations.of(context).text("want-quit")}'),
            content: Text(
                '${AppTranslations.of(context).text("lost-all-this-session")}'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '${AppTranslations.of(context).text("cancel")}',
                  style: TextStyle(color: Color(0xFF29c268)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  return false;
                },
              ),
              FlatButton(
                child: Text(
                  '${AppTranslations.of(context).text("ok")}',
                  style: TextStyle(color: Color(0xFF29c268)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  return true;
                },
              ),
            ],
          );
        });
  }

  Future<void> uploadData() async {
    // toggleLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      db
          .collection("users")
          .where("authentication_uid",
              isEqualTo: "${prefs.getString("uidUser")}")
          .snapshots()
          .listen((data) {
        if (data.documents.length > 0) {
          print('docId: ${data.documents[0].documentID}');
          updateFirestore(data);
        } else {
          print("error bos!");
          // toggleLoading(false);
        }
        toggleLoading(false);
      });
    } catch (e) {
      print(e);
    }
  }

  void updateFirestore(data) {
    try {
      Map _temp = {
        "firstname": "${firstnameController.text}",
        "lastname": "${lastnameController.text}",
        "avatar": this.widget.avatar,
        "email": "${emailController.text}",
        "gender": "$currentGender",
        "bod": selectedBirthDate.millisecondsSinceEpoch,
        "place_of_birth": "${placeOfBirthController.text ?? ""}",
        "country_code": "${currentCountryCode ?? ""}",
        "phone": "${phoneNumberController.text ?? ""}",
        "job_title": "${jobTitleController.text ?? ""}",
        "country": "${countryController.text ?? ""}",
        "province": "${provinceController.text ?? ""}",
        "city": "${cityController.text ?? ""}",
        "address": "${addressController.text ?? ""}",
        "nationality": "${nationalityController.text ?? ""}",
        "driving_licenses": "${drivingLicensesController.text ?? ""}",
        "about_you": "${aboutYouController.text ?? ""}",
        "employment": employmentList ?? [],
        "education": educationList ?? [],
        "skills": skillsList ?? [],
        "languages": languagesList ?? [],
        "out_school_activities": outSchoolActivitiesList ?? [],
        "references": referencesList ?? [],
        "hobbies": hobbiesList ?? [],
        "courses": coursesList ?? [],
        "socials": socialList ?? []
      };
      db
          .collection('users')
          .document('${data.documents[0].documentID}')
          .updateData(Map<String, dynamic>.from(_temp))
          .then((res) {
        print("Update ${data.documents[0]['email']} Success");

        storage.setItem('userProfile', Map<String, dynamic>.from(_temp));
        print(storage.getItem('userProfile'));
        Navigator.pop(context);
      }).catchError((err) {
        print(err);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void getSkills() {
    db.collection("skills").getDocuments().then((data) {
      if (data.documents.length > 0) {
        List<String> items = List();
        print(data.documents[0].data);
        for (var item in data.documents) {
          items.add(item.data['name']);
        }
        setState(() {
          typeSkills = items;
        });
      } else {
        print("Error fetch skills");
      }
    });
  }

  void getLanguages() {
    db.collection("languages").getDocuments().then((data) {
      if (data.documents.length > 0) {
        List<String> items = List();
        print(data.documents[0].data);
        for (var item in data.documents) {
          items.add(item.data['name']);
        }
        setState(() {
          languages = items;
        });
      } else {
        print("Error fetch Languages");
      }
    });
  }

  void getHobbies() {
    db.collection("hobbies").getDocuments().then((data) {
      if (data.documents.length > 0) {
        List<String> items = List();
        print(data.documents[0].data);
        for (var item in data.documents) {
          items.add(item.data['name']);
        }
        setState(() {
          hobbies = items;
        });
      } else {
        print("Error fetch Hobby");
      }
    });
  }

  void fetchLocalStorage() {
    storage.ready.then((_) {
      Map _userProfile = Map();
      _userProfile = storage.getItem('userProfile');
      print(_userProfile);
      setState(() {
        firstnameController.text = _userProfile['firstname'];
        lastnameController.text = _userProfile['lastname'];
        emailController.text = _userProfile['email'];
        currentGender = _userProfile['gender'];
        selectedBirthDate = DateTime.fromMillisecondsSinceEpoch(
            _userProfile['bod'] ?? DateTime(2000).millisecondsSinceEpoch);
        placeOfBirthController.text = _userProfile['place_of_birth'] ?? "";
        currentCountryCode = _userProfile['country_code'] ?? "";
        phoneNumberController.text = _userProfile['phone'] ?? "";
        jobTitleController.text = _userProfile['job_title'] ?? "";
        countryController.text = _userProfile['country'] ?? "";
        provinceController.text = _userProfile['province'] ?? "";
        cityController.text = _userProfile['city'] ?? "";
        addressController.text = _userProfile['address'] ?? "";
        nationalityController.text = _userProfile['nationality'] ?? "";
        drivingLicensesController.text = _userProfile['driving_licenses'] ?? "";
        aboutYouController.text = _userProfile['about_you'] ?? "";
        employmentList = _userProfile['employment'] ?? List();
        educationList = _userProfile['education'] ?? List();
        skillsList = _userProfile['skills'] ?? List();
        languagesList = _userProfile['languages'] ?? List();
        outSchoolActivitiesList =
            _userProfile['out_school_activities'] ?? List();
        hobbiesList = _userProfile['hobbies'] ?? List();
        referencesList = _userProfile['references'] ?? List();
        coursesList = _userProfile['courses'] ?? List();
        socialList = _userProfile['socials'] ?? List();
      });
    });
  }

  void imageSelect(context) {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext context) {
          return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          await getImage(1);
                          await cropImage();
                          Navigator.pop(context);
                          await pickSaveImage();
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: RaisedButton(
                              color: Color(0xFF282828),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await getImage(1);
                                await cropImage();
                                Navigator.pop(context);
                                await pickSaveImage();
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text("Select from Camera"),
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () async {
                          await getImage(0);
                          await cropImage();
                          Navigator.pop(context);
                          await pickSaveImage();
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: RaisedButton(
                              color: Color(0xFF282828),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await getImage(0);
                                await cropImage();
                                Navigator.pop(context);
                                await pickSaveImage();
                              },
                              child: Icon(
                                Icons.photo_library,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text("Select from Gallery"),
                        ),
                      ),
                    ],
                  )));
        });
  }

  Future getImage(int type) async {
    try {
      var _image = await ImagePicker.pickImage(
          source: type == 0 ? ImageSource.gallery : ImageSource.camera);

      setState(() {
        image = _image;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<Null> cropImage() async {
    try {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        maxWidth: 512,
        maxHeight: 512,
      );

      setState(() {
        image = croppedFile;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> pickSaveImage() async {
    try {
      String imageFile = path.basename(image.path);
      StorageReference ref =
          FirebaseStorage.instance.ref().child("references").child(imageFile);
      StorageUploadTask uploadTask = ref.putFile(image);

      String _imageUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      setState(() {
        imageUrl = _imageUrl;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getSkills();
    getLanguages();
    getHobbies();
    dropDownMenuItems = getDropDownMenuItems();
    selectedLevel = dropDownMenuItems[0].value;
    dropDownMenuGender = getDropDownMenuGender();
    dropDownMenuMastery = getDropDownMenuMastery();
    dropDownMenuSocial = getDropDownMenuSocial();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchLocalStorage();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
