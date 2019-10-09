import 'package:flutter/material.dart';

class SingleList extends StatelessWidget {
  final String value, image, subvalue;
  final IconData icon;

  SingleList({this.icon, this.image, this.value, this.subvalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            image == null
                ? SizedBox(width: 10)
                : Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF747d8c)),
                        borderRadius: BorderRadius.circular(25)),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      backgroundImage: NetworkImage(
                          "$image"),
                    )),
            image == null ? Container() : SizedBox(width: 10),
            icon == null ? Container() : Icon(icon, color: Color(0xFF2f3542)),
            icon == null ? Container() : SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$value",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF2f3542)),
                  ),
                  Text(
                    "$subvalue",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontSize: 13,
                        color: Color(0xFF2f3542)),
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(height: 25),
      ],
    );
  }
}
