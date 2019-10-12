import 'package:flutter/material.dart';
import './new_resume.dart';

abstract class NewResumeViewModel extends State<NewResume> {
  int currentStep = 0;
  List stepper = [
    {"icon": Icons.person, "name": "Personal\nInformation"},
    {"icon": Icons.assignment, "name": "Professional\nSummary"},
    {"icon": Icons.business_center, "name": "Employment\nHistory"},
    {"icon": Icons.school, "name": "Education"},
    {"icon": Icons.fitness_center, "name": "Skills"},
  ];

  DateTime selectedBirthDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  bool addEmployment = false;
  bool addEducation = false;

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

  void changeStep() {
    setState(() {
      currentStep++;
    });
  }

  void backStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    } else {
      print("Current Step : 0");
    }
  }
}
