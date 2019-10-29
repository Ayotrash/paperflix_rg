import 'package:flutter/material.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/home/home.dart';
import './new_resume.dart';

abstract class NewResumeViewModel extends State<NewResume> {
  ScrollController stepScroll = ScrollController();
  int currentStep = 0;

  DateTime selectedBirthDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  bool addEmployment = false;
  bool addEducation = false;
  bool addSkills = false;

  List levelSkills = [
    "Beginner",
    "Easy",
    "Intermediate",
    "Experienced",
    "Master"
  ];

  List<DropdownMenuItem<String>> dropDownMenuItems;
  String selectedLevel = "";

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (var level in levelSkills) {
      items.add(new DropdownMenuItem(
          value: level,
          child: new Text(
            level,
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
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedBirthDate)
      setState(() {
        selectedBirthDate = picked;
      });
  }

  Future<Null> selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate)
      setState(() {
        selectedStartDate = picked;
      });
  }

  Future<Null> selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
      });
  }

  void onBtnAddEmployment() {
    setState(() {
      addEmployment = !addEmployment;
    });
    print(addEmployment);
  }

  void onBtnAddEducation() {
    setState(() {
      addEducation = !addEducation;
    });
    print(addEducation);
  }

  void onBtnAddSkills() {
    setState(() {
      addSkills = !addSkills;
    });
    print(addSkills);
  }

  void changeStep() {
    if (currentStep < 4) {
      moveNext();
      setState(() {
        currentStep++;
      });
    } else {
      print("Current Step : (5) Max");
      Navigator.push(context, NavigationRoute(enterPage: Home()));
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

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    selectedLevel = dropDownMenuItems[0].value;
    super.initState();
  }
}
