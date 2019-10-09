import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String value;

  CustomChip(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      decoration: BoxDecoration(
          color: Color(0xFF2f3542), borderRadius: BorderRadius.circular(10)),
      child: Text(
        "$value",
        style: TextStyle(
            fontFamily: "SFP_Text",
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}
