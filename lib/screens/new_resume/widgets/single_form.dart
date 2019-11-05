import 'package:flutter/material.dart';

class SingleForm extends StatelessWidget {
  final String label, value;
  final bool edit;
  final onEdit;

  SingleForm({this.label, this.value, this.onEdit, this.edit: true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
            ),
            edit
                ? IconButton(
                    icon: Icon(Icons.edit),
                    color: Color(0xFF2dd573),
                    onPressed: () => onEdit(),
                  )
                : SizedBox()
          ],
        ),
      ],
    );
  }
}
