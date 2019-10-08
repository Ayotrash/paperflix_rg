import 'package:flutter/material.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/premium/premium.dart';

class PremiumCard extends StatefulWidget {
  @override
  _PremiumCardState createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: Colors.white,
        color: Color(0xFF1e90ff),
        onPressed: () =>
            Navigator.push(context, NavigationRoute(enterPage: Premium())),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 80,
              child: Image.asset("assets/premium.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 22,
                        child: Image.asset("assets/lightning.png"),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Upgrade to Premium Plan",
                        style: TextStyle(
                          fontFamily: "SFP_Text",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Get access to many template and without ads",
                    style: TextStyle(
                        fontFamily: "SFP_Text",
                        letterSpacing: 0.5,
                        fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RichText(
                        text: new TextSpan(
                          text: '',
                          style: TextStyle(fontFamily: "SFP_Text"),
                          children: <TextSpan>[
                            new TextSpan(
                                text: '\$5 ',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough)),
                            new TextSpan(
                                text: '\$2',
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                            new TextSpan(text: ' / week'),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
