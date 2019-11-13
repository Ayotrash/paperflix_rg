import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_area.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_phone.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_text.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/select_suggestion.dart';
import 'package:uuid/uuid.dart';
import 'package:toast/toast.dart';
import 'package:path/path.dart' as path;

class AddDataProfile extends StatefulWidget {
  final int type;
  final setData;

  AddDataProfile(this.type, this.setData);

  @override
  _AddDataProfileState createState() => _AddDataProfileState();
}

class _AddDataProfileState extends State<AddDataProfile> {
  final db = Firestore.instance;
  var uuid = new Uuid();
  File imageRef;
  String imageRefUrl;

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

  bool employmentPresent = false;
  bool outSchoolPresent = false;
  bool educationPresent = false;
  bool coursesPresent = false;

  List<String> typeSkills = List();
  List<String> languages = List();
  List<String> hobbies = List();

  List skillsList = List();
  List languagesList = List();
  List hobbiesList = List();
  List socialList = List();

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

  List<DropdownMenuItem<String>> dropDownMenuItems;
  List<DropdownMenuItem<String>> dropDownMenuMastery;
  List<DropdownMenuItem<String>> dropDownMenuSocial;
  String selectedLevel = "beginner";
  String selectedMastery = "beginner";
  String currentSocial = "facebook";

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

  String currentCountryCodePreferences;

  void onCountryCodeReferencesSelect(code) {
    setState(() {
      currentCountryCodePreferences = code;
    });
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

  void changedDropDownSocial(String selectedSocial) {
    setState(() {
      currentSocial = selectedSocial;
    });
  }

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

  void toastMsg(String message) {
    Toast.show("$message", context,
        backgroundColor: Color(0xFF747d8c),
        textColor: Colors.white,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
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
        skillsList = _userProfile['skills'] ?? List();
        languagesList = _userProfile['languages'] ?? List();
        hobbiesList = _userProfile['hobbies'] ?? List();
        socialList = _userProfile['socials'] ?? List();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocalStorage();
    getSkills();
    getLanguages();
    getHobbies();
    dropDownMenuItems = getDropDownMenuItems();
    dropDownMenuMastery = getDropDownMenuMastery();
    dropDownMenuSocial = getDropDownMenuSocial();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // });
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
        imageRef = _image;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<Null> cropImage() async {
    try {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageRef.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        maxWidth: 512,
        maxHeight: 512,
      );

      setState(() {
        imageRef = croppedFile;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> pickSaveImage() async {
    try {
      String imageFile = path.basename(imageRef.path);
      StorageReference ref =
          FirebaseStorage.instance.ref().child("references").child(imageFile);
      StorageUploadTask uploadTask = ref.putFile(imageRef);

      String _imageUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      setState(() {
        imageRefUrl = _imageUrl;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> onBtnAdd(type) async {
    if (type == 0) {
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

        widget.setData(0, _employmentTemp);
        setState(() {
          employmentJobTitleController.text = "";
          employmentCompanyController.text = "";
          employmentCityController.text = "";
          employmentDescriptionController.text = "";
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          employmentPresent = false;
        });
        Navigator.pop(context);
      } else {
        toastMsg("You must fill all the fields");
      }
    } else if (type == 1) {
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

        widget.setData(1, _outSchoolTemp);
        setState(() {
          outSchoolFunctionTitleController.text = "";
          outSchoolOrganizationController.text = "";
          outSchoolCityController.text = "";
          outSchoolDescriptionController.text = "";
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          outSchoolPresent = false;
        });
        Navigator.pop(context);
      } else {
        toastMsg("You must fill all the fields");
      }
    } else if (type == 2) {
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

        widget.setData(2, _educationTemp);

        setState(() {
          educationUniversityController.text = "";
          educationDegreeController.text = "";
          educationFieldOfStudyController.text = "";
          educationSocialActivitiesController.text = "";
          educationDescriptionController.text = "";
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          educationPresent = false;
        });
        Navigator.pop(context);
      } else {
        toastMsg("You must fill all the fields");
      }
    } else if (type == 3) {
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

        widget.setData(3, _coursesTemp);

        setState(() {
          coursesTextController.text = "";
          coursesInstitutionController.text = "";
          selectedStartDate = DateTime(2019);
          selectedEndDate = DateTime(2019);
          coursesPresent = false;
        });
        Navigator.pop(context);
      } else {
        toastMsg("You must fill all the fields");
      }
    } else if (type == 4) {
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
              "${imageRefUrl ?? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"}",
          "phone": "${referencesPhoneNumberController.text}",
          "country_code": "$currentCountryCodePreferences",
          "description": "${referencesDescriptionController.text}",
        };

        widget.setData(4, _referencesTemp);

        setState(() {
          referencesFullnameController.text = "";
          referencesCompanyController.text = "";
          referencesEmailController.text = "";
          referencesPhoneNumberController.text = "";
          referencesDescriptionController.text = "";
        });
        Navigator.pop(context);
      } else {
        toastMsg("You must fill all the fields");
      }
    } else if (type == 5) {
      Map _skill = {
        "id": uuid.v1(),
        "skill_type": "${skillsTypeSkillController.text}",
        "level": "$selectedLevel"
      };
      if (skillsList.toString().contains(_skill['skill_type'].toString())) {
        toastMsg("${skillsTypeSkillController.text} already in your skills.");
      } else {
        if (skillsTypeSkillController.text.length > 0 &&
            selectedLevel.length > 0) {
          widget.setData(5, _skill);
          setState(() {
            skillsList.add(_skill);
            skillsTypeSkillController.text = "";
            selectedLevel = dropDownMenuItems[0].value;
          });
          Navigator.pop(context);
        }
      }
    } else if (type == 6) {
      Map _language = {
        "id": uuid.v1(),
        "language": "${languageTextController.text}",
        "level": "$selectedMastery"
      };
      if (languagesList.toString().contains(_language['language'].toString())) {
        toastMsg("${languageTextController.text} already in your languages.");
      } else {
        if (languageTextController.text.length > 0 &&
            selectedMastery.length > 0) {
          widget.setData(6, _language);

          setState(() {
            languagesList.add(_language);
            languageTextController.text = "";
            selectedLevel = dropDownMenuMastery[0].value;
          });
          print(languagesList);
          Navigator.pop(context);
        }
      }
    } else if (type == 7) {
      Map _social = {
        "type": "$currentSocial",
        "link": "${socialLinkController.text}"
      };
      if (socialList.toString().contains(_social['type'].toString())) {
        toastMsg(
            "${_social['type'][0].toUpperCase()}${_social['type'].substring(1)} already in your social.");
      } else {
        if (socialLinkController.text.length > 0 && currentSocial.length > 0) {
          widget.setData(7, _social);

          setState(() {
            socialList.add(_social);
            socialLinkController.text = "";
            currentSocial = dropDownMenuSocial[0].value;
          });
          print(socialList);
          Navigator.pop(context);
        }
      }
    } else if (type == 8) {
      String _hobby = "${hobbiesTextController.text}";
      if (hobbiesList.contains(hobbiesTextController.text)) {
        toastMsg("${hobbiesTextController.text} already in your Hobbies.");
      } else {
        if (hobbiesTextController.text.length > 0) {
          widget.setData(8, _hobby);
          setState(() {
            hobbiesList.add(_hobby);
            hobbiesTextController.text = "";
            selectedLevel = dropDownMenuItems[0].value;
          });
          print(hobbiesList);
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String _type = widget.type == 0
        ? 'employment'
        : widget.type == 1
            ? 'activities'
            : widget.type == 2
                ? 'education-v2'
                : widget.type == 3
                    ? 'courses'
                    : widget.type == 4
                        ? 'references'
                        : widget.type == 5
                            ? 'skills-v2'
                            : widget.type == 6
                                ? 'languages'
                                : widget.type == 7
                                    ? 'socials'
                                    : widget.type == 8 ? 'hobby' : "";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  width: screenSize.width - 50,
                  margin: MediaQuery.of(context).viewInsets.bottom == 0
                      ? EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 25)
                      : EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 25),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (widget.type == 0)
                          Container(
                            width: screenSize.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FormText(
                                  label:
                                      "${AppTranslations.of(context).text("job-title")}",
                                  hint: "e.g. Marketing Manager",
                                  controller: employmentJobTitleController,
                                ),
                                FormText(
                                  label:
                                      "${AppTranslations.of(context).text("company")}",
                                  hint: "e.g. Google",
                                  controller: employmentCompanyController,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 10),
                                            Text(
                                              "${AppTranslations.of(context).text("start-date")}",
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
                                                  selectStartDate(context),
                                              child: Container(
                                                width: screenSize.width,
                                                child: Text(
                                                    "${DateFormat('MMMM yyyy').format(selectedStartDate)}",
                                                    textAlign: TextAlign.left),
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
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "${AppTranslations.of(context).text("end-date")}",
                                                    style: TextStyle(
                                                        fontFamily: "SFP_Text",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xFF2f3542)),
                                                  ),
                                                  SizedBox(height: 7),
                                                  RaisedButton(
                                                    padding: EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 12,
                                                        bottom: 12),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    color: Color(0xFFf1f2f6),
                                                    textColor:
                                                        Color(0xFF2F3542),
                                                    onPressed: () =>
                                                        selectEndDate(context),
                                                    child: Container(
                                                      width: screenSize.width,
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
                                      activeColor: Color(0xFF2f3542),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.padded,
                                      value: employmentPresent,
                                      onChanged: (bool value) {
                                        setState(() {
                                          employmentPresent = value;
                                        });
                                      },
                                    ),
                                    Flexible(
                                        child: Text(
                                            '${AppTranslations.of(context).text("until-now")}',
                                            style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 13.3,
                                              color: Color(0xFF2f3542),
                                            )))
                                  ],
                                ),
                                FormText(
                                  label:
                                      "${AppTranslations.of(context).text("city")}",
                                  hint: "e.g. California, New York",
                                  controller: employmentCityController,
                                ),
                                FormArea(
                                  label:
                                      "${AppTranslations.of(context).text("description")}",
                                  hint:
                                      "e.g. I'am take responbilities with all of the student or employees in this company.",
                                  minLines: 10,
                                  maxLines: 20,
                                  controller: employmentDescriptionController,
                                )
                              ],
                            ),
                          )
                        else if (widget.type == 1)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                children: <Widget>[
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("function_title")}",
                                    hint: "e.g. Chairman",
                                    controller:
                                        outSchoolFunctionTitleController,
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("organization")}",
                                    hint: "e.g. Hacker United",
                                    controller: outSchoolOrganizationController,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 10),
                                              Text(
                                                "${AppTranslations.of(context).text("start-date")}",
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
                                                    selectStartDate(context),
                                                child: Container(
                                                  width: screenSize.width,
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
                                                      CrossAxisAlignment.start,
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
                                                      padding: EdgeInsets.only(
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
                                                      color: Color(0xFFf1f2f6),
                                                      textColor:
                                                          Color(0xFF2F3542),
                                                      onPressed: () =>
                                                          selectEndDate(
                                                              context),
                                                      child: Container(
                                                        width: screenSize.width,
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
                                        activeColor: Color(0xFF2f3542),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        value: outSchoolPresent,
                                        onChanged: (bool value) {
                                          setState(() {
                                            outSchoolPresent = value;
                                          });
                                        },
                                      ),
                                      Flexible(
                                          child: Text(
                                              '${AppTranslations.of(context).text("until-now")}',
                                              style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontSize: 13.3,
                                                color: Color(0xFF2f3542),
                                              )))
                                    ],
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("city")}",
                                    hint: "e.g. California, New York",
                                    controller: outSchoolCityController,
                                  ),
                                  FormArea(
                                    label:
                                        "${AppTranslations.of(context).text("description")}",
                                    hint:
                                        "e.g. I'am take responbilities with all of the member in this organization.",
                                    minLines: 10,
                                    maxLines: 20,
                                    controller: outSchoolDescriptionController,
                                  )
                                ],
                              ))
                        else if (widget.type == 2)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                children: <Widget>[
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("university")}",
                                    hint: "e.g. Oxford University",
                                    controller: educationUniversityController,
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("degree")}",
                                    hint: "e.g. Management Bachelor",
                                    controller: educationDegreeController,
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("field-of-study")}",
                                    hint: "e.g. Bussiness",
                                    controller: educationFieldOfStudyController,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 10),
                                              Text(
                                                "${AppTranslations.of(context).text("start-date")}",
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
                                                    selectStartDate(context),
                                                child: Container(
                                                  width: screenSize.width,
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
                                                      CrossAxisAlignment.start,
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
                                                      padding: EdgeInsets.only(
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
                                                      color: Color(0xFFf1f2f6),
                                                      textColor:
                                                          Color(0xFF2F3542),
                                                      onPressed: () =>
                                                          selectEndDate(
                                                              context),
                                                      child: Container(
                                                        width: screenSize.width,
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
                                        activeColor: Color(0xFF2f3542),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        value: educationPresent,
                                        onChanged: (bool value) {
                                          setState(() {
                                            educationPresent = value;
                                          });
                                        },
                                      ),
                                      Flexible(
                                          child: Text(
                                              '${AppTranslations.of(context).text("until-now")}',
                                              style: TextStyle(
                                                fontFamily: "SFP_Text",
                                                fontSize: 13.3,
                                                color: Color(0xFF2f3542),
                                              )))
                                    ],
                                  ),
                                  FormArea(
                                    label:
                                        "${AppTranslations.of(context).text("social-activities")}",
                                    hint: "e.g. Volleyball, Student Council",
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
                                    controller: educationDescriptionController,
                                  )
                                ],
                              ))
                        else if (widget.type == 3)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                children: <Widget>[
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("courses")}",
                                    hint: "e.g. Javascript Website",
                                    controller: coursesTextController,
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("institution")}",
                                    hint: "e.g. Nextbyte",
                                    controller: coursesInstitutionController,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 10),
                                              Text(
                                                "${AppTranslations.of(context).text("start-date")}",
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
                                                    selectStartDate(context),
                                                child: Container(
                                                  width: screenSize.width,
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
                                                      CrossAxisAlignment.start,
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
                                                      padding: EdgeInsets.only(
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
                                                      color: Color(0xFFf1f2f6),
                                                      textColor:
                                                          Color(0xFF2F3542),
                                                      onPressed: () =>
                                                          selectEndDate(
                                                              context),
                                                      child: Container(
                                                        width: screenSize.width,
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
                                        activeColor: Color(0xFF2f3542),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
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
                                                fontFamily: "SFP_Text",
                                                fontSize: 13.3,
                                                color: Color(0xFF2f3542),
                                              )))
                                    ],
                                  ),
                                ],
                              ))
                        else if (widget.type == 4)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 120,
                                            width: 120,
                                            // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            alignment: Alignment.bottomCenter,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFf1f2f6),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: imageRefUrl != null
                                                ? SizedBox(
                                                    height: 120,
                                                    width: 120,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                            "$imageRefUrl")))
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
                                                padding: EdgeInsets.zero,
                                                onPressed: () =>
                                                    imageSelect(context),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                    ),
                                    SizedBox(height: 30),
                                    FormText(
                                      label:
                                          "${AppTranslations.of(context).text("full-name")}",
                                      hint: "e.g. John Doe",
                                      controller: referencesFullnameController,
                                    ),
                                    FormText(
                                      label:
                                          "${AppTranslations.of(context).text("company")}",
                                      hint: "e.g. Google",
                                      controller: referencesCompanyController,
                                    ),
                                    FormText(
                                      label:
                                          "${AppTranslations.of(context).text("email")}",
                                      hint: "e.g. johndoe@gmail.com",
                                      controller: referencesEmailController,
                                    ),
                                    FormPhone(
                                      label:
                                          "${AppTranslations.of(context).text("phone-number")}",
                                      hint: "e.g. 8123123123",
                                      controller:
                                          referencesPhoneNumberController,
                                      onChange: onCountryCodeReferencesSelect,
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
                        else if (widget.type == 5)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SelectSuggestion(
                                      label:
                                          "${AppTranslations.of(context).text("widget.type-skill")}",
                                      hint: "e.g. Design Graphics",
                                      controller: skillsTypeSkillController,
                                      getSuggestions: getSuggestionSkill,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFf1f2f6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButtonHideUnderline(
                                        child: new DropdownButton(
                                          value: selectedLevel,
                                          items: dropDownMenuItems,
                                          onChanged: changedDropDownItem,
                                        ),
                                      ),
                                    )
                                  ]))
                        else if (widget.type == 6)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SelectSuggestion(
                                      label:
                                          "${AppTranslations.of(context).text("language")}",
                                      hint: "e.g. English",
                                      controller: languageTextController,
                                      getSuggestions: getSuggestionLanguages,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${AppTranslations.of(context).text("level-mastery")}",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: Color(0xFF2f3542)),
                                    ),
                                    SizedBox(height: 7),
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
                                          value: selectedMastery,
                                          items: dropDownMenuMastery,
                                          onChanged: changedDropDownMastery,
                                        ),
                                      ),
                                    )
                                  ]))
                        else if (widget.type == 7)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Text(
                                    "${AppTranslations.of(context).text("socials")}",
                                    style: TextStyle(
                                        fontFamily: "SFP_Text",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Color(0xFF2f3542)),
                                  ),
                                  SizedBox(height: 7),
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
                                        value: currentSocial,
                                        items: dropDownMenuSocial,
                                        onChanged: changedDropDownSocial,
                                      ),
                                    ),
                                  ),
                                  FormText(
                                    label:
                                        "${AppTranslations.of(context).text("link")}",
                                    hint: "e.g. https://github.com/arsyadsr09",
                                    controller: socialLinkController,
                                  ),
                                ],
                              ))
                        else if (widget.type == 8)
                          Container(
                              width: screenSize.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SelectSuggestion(
                                      label:
                                          "${AppTranslations.of(context).text("hobby")}",
                                      hint: "e.g. Badminton",
                                      controller: hobbiesTextController,
                                      getSuggestions: getSuggestionHobbies,
                                    ),
                                  ])),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        color: Color(0xFF2f3542),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(Icons.close)),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0 
                // ||
                //         widget.type == 3 ||
                //         widget.type == 5 ||
                //         widget.type == 6 ||
                //         widget.type == 7 ||
                //         widget.type == 8
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () {
                              onBtnAdd(widget.type);
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            color: Color(0xFF2dd573),
                            textColor: Colors.white,
                            child: Text(
                              "+ ${AppTranslations.of(context).text("add")} ${AppTranslations.of(context).text("$_type")}",
                              style: TextStyle(
                                  fontFamily: "SFP_Text",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
