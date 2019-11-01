import 'package:flutter/material.dart';
import 'package:paperflix_rg/localization/app_translations.dart';

class SingleList extends StatefulWidget {
  final String value, time, subvalue;
  final IconData icon;

  SingleList({this.icon, this.value, this.time, this.subvalue});

  @override
  _SingleListState createState() => _SingleListState();
}

class _SingleListState extends State<SingleList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(widget.icon, color: Color(0xFF2f3542)),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.value}",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF2f3542)),
                  ),
                  Text(
                    "${widget.time}",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontSize: 13,
                        color: Color(0xFF2f3542)),
                  ),
                  SizedBox(height: 7),
                  RichText(
                    text: new TextSpan(
                      text:
                          "${widget.subvalue.length > 150 ? widget.subvalue.substring(0, 149) : widget.subvalue} ",
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontSize: 13,
                          color: Color(0xFF2f3542)),
                      children: <TextSpan>[
                        new TextSpan(
                            text:
                                '${widget.subvalue.length > 150 ? "Read more" : ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2dd573))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.edit, color: Color(0xFF2dd573)),
          ],
        ),
        FlatButton(
          onPressed: () {},
          textColor: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.delete,
                size: 17,
              ),
              SizedBox(width: 3),
              Text(
                "${AppTranslations.of(context).text("delete")}",
                style: TextStyle(
                  fontFamily: "SFP_Text",
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0),
        SizedBox(height: 20)
      ],
    );
  }
}
