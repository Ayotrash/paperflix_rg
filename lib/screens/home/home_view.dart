import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperflix_rg/config/config.dart';
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
                title: FutureBuilder(
                    future: storage.ready,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.data == null) {
                        return Container();
                      } else {
                        Map<String, dynamic> data =
                            storage.getItem('userProfile');

                        return AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 500),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context, NavigationRoute(enterPage: Profile())),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                data['avatar'] != null
                                    ? Container(
                                        width: 35,
                                        height: 35,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                                "${data['avatar'] == null ? data['gender'] == 'female' ? 'https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572640034110.jpg?alt=media&token=f808358e-67e0-4edf-a147-eabc98abacd6' : 'https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7' : data["avatar"]}")),
                                      )
                                    : Container(
                                        height: 35,
                                        width: 35,
                                        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFf1f2f6),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: data['gender'] == 'female'
                                              ? Image.asset("assets/girl.png")
                                              : Image.asset("assets/boy.png"),
                                        ),
                                      ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${AppTranslations.of(context).text("hi")}, ${data['firstname'] ?? widget.firstname}",
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
                        );
                      }
                    }),
                actions: <Widget>[
                  IconButton(
                    onPressed: () => signOut(),
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
