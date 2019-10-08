import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './premium_view_model.dart';

class PremiumView extends PremiumViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Color(0xFFFAFAFA),
              title: Text("Upgrade to Premium",
                  style: TextStyle(
                    fontFamily: "SFP_Text",
                  )),
            )
          ];
        },
        body: Container(
          width: screenSize.width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenSize.width,
                        constraints: BoxConstraints(minHeight: 200),
                        margin: EdgeInsets.fromLTRB(15, 20, 15, 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                child: Image.asset("assets/premium.png"),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 22,
                                    child: Image.asset("assets/lightning.png"),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Premium Plan",
                                    style: TextStyle(
                                      fontFamily: "SFP_Text",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: screenSize.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "What you can get?",
                                      style: TextStyle(
                                        fontFamily: "SFP_Text",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFF2ed573),
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Avoiding Paperflix watermark on your resume.",
                                            style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFF2ed573),
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Get all access to our best templates.",
                                            style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFF2ed573),
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Avoiding all advertising on the app.",
                                            style: TextStyle(
                                              fontFamily: "SFP_Text",
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "\$5",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    Text(
                                      " \$2",
                                      style: TextStyle(
                                          fontFamily: "SFP_Text",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 23,
                                          color: Color(0xFF2ed573)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "per week",
                                style: TextStyle(
                                    fontFamily: "SFP_Text",
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                    color: Color(0xFF57606f),
                                    fontSize: 13),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: screenSize.width,
                          child: Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 35),
                              color: Color(0xFF2ed573),
                              textColor: Colors.white,
                              child: Text(
                                "UPGRADE NOW",
                                style: TextStyle(
                                    letterSpacing: 0.6,
                                    fontFamily: "SFP_Text",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
