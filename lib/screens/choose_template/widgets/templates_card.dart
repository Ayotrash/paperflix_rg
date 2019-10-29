import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/custom_template/custom_template.dart';

class TemplatesCard extends StatefulWidget {
  final bool premium;
  final String image, name;

  TemplatesCard({this.premium, this.image, this.name});

  @override
  _TemplatesCardState createState() => _TemplatesCardState();
}

class _TemplatesCardState extends State<TemplatesCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5, left: 5),
          width: screenSize.width / 2,
          height: 220,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: RaisedButton(
            padding: EdgeInsets.zero,
            color: Colors.white,
            onPressed: () => Navigator.push(
                context, NavigationRoute(enterPage: CustomTemplate())),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            textColor: Color(0xFF57606f),
            child: CachedNetworkImage(
              imageUrl: widget.image,
              imageBuilder: (context, imageProvider) => Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius:
                            16.0, // has the effect of softening the shadow
                        spreadRadius:
                            5.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      )
                    ],
                    image: DecorationImage(
                        fit: BoxFit.fitWidth, image: imageProvider)),
              ),
              placeholder: (context, url) => Container(
                width: screenSize.width / 2,
                height: 220,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "${widget.name}",
          style: TextStyle(
              fontFamily: "SFP_Text",
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        SizedBox(height: 3),
        widget.premium
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 18,
                    child: Image.asset("assets/premium.png"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${AppTranslations.of(context).text("premium").toUpperCase()}",
                    style: TextStyle(
                        color: Color(0xFFFF9D3B),
                        fontWeight: FontWeight.w700,
                        fontFamily: "SFP_Text",
                        fontSize: 16),
                  )
                ],
              )
            : Text(
                "${AppTranslations.of(context).text("free").toUpperCase()}",
                style: TextStyle(
                    color: Color(0xFF2ed573),
                    fontWeight: FontWeight.w700,
                    fontFamily: "SFP_Text",
                    fontSize: 16),
              ),
      ],
    );
  }
}
