import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstorage/localstorage.dart';
import 'package:toast/toast.dart';
import './new_resume.dart';

abstract class NewResumeViewModel extends State<NewResume> {
  final db = Firestore.instance;
  final LocalStorage storage = new LocalStorage('paperflix_rg');
  ScrollController stepScroll = ScrollController();
  int currentStep = 0;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController drivingLicensesController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();

  TextEditingController employmentJobTitleController = TextEditingController();
  TextEditingController employmentCompanyController = TextEditingController();
  TextEditingController employmentCityController = TextEditingController();
  TextEditingController employmentDescriptionController =
      TextEditingController();

  TextEditingController educationUniversityController = TextEditingController();
  TextEditingController educationDegreeController = TextEditingController();
  TextEditingController educationFieldOfStudyController =
      TextEditingController();
  TextEditingController educationSocialActivitiesController =
      TextEditingController();
  TextEditingController educationDescriptionController =
      TextEditingController();

  TextEditingController skillsTypeSkillController = TextEditingController();

  DateTime selectedBirthDate = DateTime(DateTime.now().year - 1);
  DateTime selectedStartDate = DateTime(2019);
  DateTime selectedEndDate = DateTime(2019);

  bool isLoading = false;
  bool addEmployment = false;
  bool addEducation = false;
  bool addSkills = false;
  bool fullnameEdit = false;
  bool genderEdit = false;
  // bool emailEdit = false;
  bool employmentPresent = false;
  bool educationPresent = false;

  List levelSkills = [
    {"id": "beginner", "text": "Beginner"},
    {"id": "intermediate", "text": "Intermediate"},
    {"id": "advanced", "text": "Advanced"},
    {"id": "expert", "text": "Expert"},
  ];
  List genders = [
    {"id": "female", "text": "Female"},
    {"id": "male", "text": "Male"},
  ];
  List employmentList = List();
  List educationList = List();
  List skillsList = List();

  List<String> typeSkills = List();

  List<DropdownMenuItem<String>> dropDownMenuItems;
  String selectedLevel = "beginner";
  List<DropdownMenuItem<String>> dropDownMenuGender;
  String currentGender = 'female';

  String currentCountryCode;

  void onCountryCodeSelect(code) {
    setState(() {
      currentCountryCode = code;
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

  List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(typeSkills);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changedDropDownGender(String selectedGender) {
    setState(() {
      currentGender = selectedGender;
    });
  }

  void toastMsg(String message) {
    Toast.show("$message", context,
        backgroundColor: Color(0xFF747d8c),
        textColor: Colors.white,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
  }

  void removeEmployment(jobTitle, company) {
    setState(() {
      employmentList.removeWhere((item) =>
          item['job_title'] == jobTitle && item['company'] == company);
    });
    toastMsg("Delete Employment Success");
  }

  void removeEducation(university, degree) {
    setState(() {
      educationList.removeWhere((item) =>
          item['university'] == university && item['degree'] == degree);
    });
    toastMsg("Delete Education Success");
  }

  void removeSkills(typeSkill, level) {
    setState(() {
      skillsList.removeWhere(
          (item) => item['skill_type'] == typeSkill && item['level'] == level);
    });
    toastMsg("Delete Skill Success");
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

  moveNext() {
    if (currentStep < 3) {
      stepScroll.animateTo(stepScroll.offset + 168,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else {
      print("no scroll");
    }
  }

  moveBack() {
    if (currentStep < 4) {
      stepScroll.animateTo(stepScroll.offset - 168,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else {
      print("no scroll");
    }
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
          "job_title": "${employmentJobTitleController.text}",
          "company": "${employmentCompanyController.text}",
          "city": "${employmentCityController.text}",
          "start_date": selectedStartDate ?? null,
          "end_date": employmentPresent ? null : selectedEndDate ?? null,
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
          "university": "${educationUniversityController.text}",
          "degree": "${educationDegreeController.text}",
          "field_of_study": "${educationFieldOfStudyController.text}",
          "start_date": selectedStartDate ?? null,
          "end_date": educationPresent ? null : selectedEndDate ?? null,
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

  void onBtnAddSkills() {
    if (!addSkills) {
      setState(() {
        addSkills = true;
      });
      print(addSkills);
    } else {
      if (skillsTypeSkillController.text.length > 0 &&
          selectedLevel.length > 0) {
        Map _skill = {
          "skill_type": "${skillsTypeSkillController.text}",
          "level": "$selectedLevel"
        };
        setState(() {
          skillsTypeSkillController.text = "";
          skillsList.add(_skill);
          selectedLevel = dropDownMenuItems[0].value;
          addSkills = false;
        });
        print(skillsList);
      }
    }
  }

  void skipStep(_context) {
    if (currentStep < 4) {
      moveNext();
      setState(() {
        currentStep++;
      });
    } else {
      print("Current Step : (5) Max");
      willNextDialog(0, _context);
    }
  }

  void changeStep(_context) {
    if (currentStep < 4) {
      moveNext();
      setState(() {
        currentStep++;
      });
    } else {
      print("Current Step : (5) Max");
      willNextDialog(1, _context);
    }
  }

  void backStep() {
    if (currentStep > 0) {
      moveBack();
      setState(() {
        currentStep--;
      });
    } else {
      print("Current Step : 0");
    }
  }

  Future<bool> willPopDialog(context) {
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
                  // return false;
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
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  // return true;
                },
              ),
            ],
          );
        });
  }

  void willNextDialog(type, context) {
    // 0 == skip || 1 == Finish
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
                '${type == 0 ? AppTranslations.of(context).text("want-skip") : AppTranslations.of(context).text("want-finish")}'),
            content: Text(
                '${AppTranslations.of(context).text("check-resume-again")}'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '${AppTranslations.of(context).text("no")}',
                  style: TextStyle(color: Color(0xFF29c268)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  '${AppTranslations.of(context).text("yes")}',
                  style: TextStyle(color: Color(0xFF29c268)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (type == 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        NavigationRoute(enterPage: Home()),
                        ModalRoute.withName('/Auth'));
                  } else {
                    uploadData();
                  }
                },
              ),
            ],
          );
        });
  }

  Future<void> uploadData() async {
    toggleLoading();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map _temp = {
      "firstname": "${firstnameController.text ?? this.widget.firstname}",
      "lastname": "${lastnameController.text ?? this.widget.lastname}",
      "email": "${emailController.text ?? this.widget.email}",
      "gender": "${currentGender ?? this.widget.gender}",
      "birth_date": selectedBirthDate,
      "place_of_birth": "${placeOfBirthController.text ?? ""}",
      "phone_number": "$currentCountryCode${phoneNumberController.text ?? ""}",
      "job_title": "${jobTitleController.text ?? ""}",
      "country": "${countryController.text ?? ""}",
      "city": "${cityController.text ?? ""}",
      "address": "${addressController.text ?? ""}",
      "driving_licenses": "${drivingLicensesController.text ?? ""}",
      "about_you": "${aboutYouController.text ?? ""}",
      "employment": employmentList ?? [],
      "education": educationList ?? [],
      "skills": skillsList ?? []
    };
    try {
      db
          .collection("users")
          .where("authentication_uid",
              isEqualTo: "${prefs.getString("uidUser")}")
          .snapshots()
          .listen((data) {
        if (data.documents.length > 0) {
          print('docId: ${data.documents[0].documentID}');
          db
              .collection('users')
              .document('${data.documents[0].documentID}')
              .updateData(Map<String, dynamic>.from(_temp))
              .then((res) {
            print("Update ${data.documents[0]['email']} Success");
            toastMsg("Data Upload Success");
            storage.setItem('userProfile', _temp);
            print(storage.getItem('userProfile'));

            Navigator.of(context).pushAndRemoveUntil(
                NavigationRoute(enterPage: Home()),
                ModalRoute.withName('/Auth'));
          }).catchError((err) {
            print(err);
          });
        } else {
          toggleLoading();
        }
      });
    } catch (e) {
      print(e);
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
          print("Error fetch countries_code");
        }
      });
  }

  @override
  void initState() {
    getSkills();
    dropDownMenuItems = getDropDownMenuItems();
    selectedLevel = dropDownMenuItems[0].value;
    dropDownMenuGender = getDropDownMenuGender();
    currentGender = this.widget.gender ?? dropDownMenuGender[0].value;
    firstnameController.text = this.widget.firstname;
    lastnameController.text = this.widget.lastname;
    emailController.text = this.widget.email;
    super.initState();
  }
}
