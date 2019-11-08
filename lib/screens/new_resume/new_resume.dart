import 'package:flutter/material.dart';
import './new_resume_view.dart';

class NewResume extends StatefulWidget {
  final String firstname, lastname, gender, email, avatar;

  NewResume({this.firstname, this.lastname, this.gender, this.email, this.avatar});
  
  @override
  NewResumeView createState() => new NewResumeView();
}
  
