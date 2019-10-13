import 'package:flutter/material.dart';

class ColorsList extends StatelessWidget {
  final int color;
  final String value, subvalue;

  ColorsList({this.color, this.value, this.subvalue});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Color(color).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$value",
            style: TextStyle(
                fontFamily: "SFP_Text",
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xFF2f3542)),
          ),
          Text("$subvalue",
              style: TextStyle(
                fontFamily: "SFP_Text",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(color),
              )),
        ],
      ),
    );
  }
}
