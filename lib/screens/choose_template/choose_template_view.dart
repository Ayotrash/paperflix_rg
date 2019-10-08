import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/screens/choose_template/widgets/templates_card.dart';
import './choose_template_view_model.dart';

class ChooseTemplateView extends ChooseTemplateViewModel {
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
              title: Text("Choose Your Template",
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
                  SizedBox(height: 15),
                  Container(
                      width: screenSize.width,
                      child: GridView.count(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.7,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            TemplatesCard(
                                image:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9KOdr0S58vCH0TqAx48mBxzWsPK_Sxd9qt4uzu_eJkkUgg48h",
                                name: "Black Rainbow",
                                premium: false),
                            TemplatesCard(
                                image:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRP3drTRJUHeC2puUbHXmMPKccvRHUrf9wCX65_FuTBc-mYHAA9",
                                name: "Black Widow",
                                premium: true),
                          ]))
                ]),
          ),
        ),
      ),
    );
  }
}
