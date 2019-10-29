import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/localization/app_translations.dart';
import 'package:paperflix_rg/screens/home/widgets/add_cv.dart';
import 'package:paperflix_rg/screens/home/widgets/cv_card.dart';
import 'package:paperflix_rg/screens/profile/profile.dart';
import 'package:paperflix_rg/widgets/premium_card.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
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
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: GestureDetector(
                  onTap: () => Navigator.push(context, NavigationRoute(enterPage: Profile())),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 35,
                        height: 35,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/arsyad.jpg")),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${AppTranslations.of(context).text("hi")}, Arsyad",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "SFP_Text",
                                fontSize: 18,
                                color: Color(0xFF2f3542)),
                          ),
                          Text(
                            "${AppTranslations.of(context).text("edit-profile")}",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontFamily: "SFP_Text",
                                fontSize: 12,
                                color: Color(0xFF2f3542)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Color(0xFF2f3542),
                  ),
                  SizedBox(width: 10)
                ],
              )
            ];
          },
          body: Container(
              width: screenSize.width,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${AppTranslations.of(context).text("create-resume1")}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: "SFP_Text",
                                fontSize: 18,
                                color: Color(0xFF2f3542)),
                          ),
                          Text(
                            "${AppTranslations.of(context).text("create-resume2")}",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontFamily: "SFP_Text",
                                fontSize: 15,
                                color: Color(0xFF2f3542)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: screenSize.width,
                      child: GridView.count(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.76,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          CVCard(
                            name: "CV Name",
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9KOdr0S58vCH0TqAx48mBxzWsPK_Sxd9qt4uzu_eJkkUgg48h",
                            lastUpdate: "10 Sept",
                          ),
                          AddCV()
                        ],
                      ),
                    ),
                    PremiumCard()
                  ]))),
        ));
  }
}
