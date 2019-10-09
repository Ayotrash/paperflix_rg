import 'package:flutter/material.dart';

class SocialList extends StatelessWidget {
  final String type, value;

  SocialList({this.type, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            if (type == "fb")
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/facebook.png")))
            else if (type == 'ig')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/instagram.png")))
            else if (type == 'gh')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/github.png")))
            else if (type == 'gp')
              SizedBox(
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/google.png")))
            else if (type == 'li')
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
                  if (type == "fb")
                    Text(
                      "Facebook",
                      style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF2f3542)),
                    )
                  else if (type == 'ig')
                    Text("Instagram",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'gh')
                    Text("Github",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'gp')
                    Text("Google Plus",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542)))
                  else if (type == 'li')
                    Text("Linkedin",
                        style: TextStyle(
                            fontFamily: "SFP_Text",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2f3542))),
                  Text(
                    "$value",
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
