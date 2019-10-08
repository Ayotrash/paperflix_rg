import 'package:flutter/material.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/screens/choose_template/choose_template.dart';

class AddCV extends StatefulWidget {
  @override
  _AddCVState createState() => _AddCVState();
}

class _AddCVState extends State<AddCV> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 2,
      height: 500,
      margin: EdgeInsets.only(bottom: 15, right: 5, left: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: RaisedButton(
        onPressed: () => Navigator.push(
            context, NavigationRoute(enterPage: ChooseTemplate())),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF2DD573),
        textColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              "Add CV Style",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SFP_Text",
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
