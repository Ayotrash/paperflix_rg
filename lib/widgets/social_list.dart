import 'package:flutter/material.dart';

class SocialList extends StatelessWidget {
  final String type, value;
  final onEdit, onDelete;

  SocialList({this.type, this.value, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 10),
            if (type == "facebook")
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/facebook.png")))
            else if (type == 'instagram')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/instagram.png")))
            else if (type == 'github')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/github.png")))
            else if (type == 'googleplus')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/google.png")))
            else if (type == 'linkedin')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/linkedin.png"))),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (type == "facebook")
                    Text(
                      "Facebook",
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF2f3542)),
                    )
                  else if (type == 'instagram')
                    Text("Instagram",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'github')
                    Text("Github",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'googleplus')
                    Text("Google Plus",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'linkedin')
                    Text("Linkedin",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542))),
                  Text(
                    "${value != null ? value.length > 32 ? value.substring(0, 31) : value : ""}",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        fontSize: 13,
                        color: Color(0xFF2f3542)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => onDelete(type),
              child: Icon(
                Icons.close,
                color: Color(0xFF2f3542),
              ),
            ),
          ],
        ),
        Divider(height: 25),
      ],
    );
  }
}
