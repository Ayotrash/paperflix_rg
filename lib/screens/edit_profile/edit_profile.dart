import 'package:flutter/material.dart';
import './edit_profile_view.dart';

class EditProfile extends StatefulWidget {
  final String avatar;
  final int type;

  EditProfile({this.type, this.avatar});

  @override
  EditProfileView createState() => new EditProfileView();
}
