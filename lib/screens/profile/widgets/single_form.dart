import 'package:flutter/material.dart';

class SingleForm extends StatelessWidget {
  final String label, value;

  SingleForm({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15),
        Text(
          "$label",
          style: TextStyle(
              fontFamily: "SFP_Text",
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color(0xFF2f3542)),
        ),
        SizedBox(height: 3),
        Text(
          "$value",
          style: TextStyle(
              fontFamily: "SFP_Text",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF2f3542)),
        )
      ],
    );
  }
}
