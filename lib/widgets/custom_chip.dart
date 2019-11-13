import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String value;
  final bool expand;
  final onDelete, onEdit;

  CustomChip(this.value, {this.expand: false, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: expand ? double.infinity : null,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF2f3542),
      ),
      child: expand
          ? Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "$value",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                onDelete != null
                    ? GestureDetector(
                        onTap: () => onDelete(value),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox()
              ],
            )
          : Text(
              "$value",
              style: TextStyle(
                  fontFamily: "SFP_Text",
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
    );
  }
}
