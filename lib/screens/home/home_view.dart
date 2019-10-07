import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFFFAFAFA),
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/Profile"),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/arsyad.jpg")),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Hi, Arsyad",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF2f3542)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () => Navigator.pushNamed(context, "/Reward"),
                  textColor: Color(0xFF2f3542),
                  child: Icon(Icons.more_vert)),
              SizedBox(width: 10)
            ],
          )
        ];
      },
      body: Container(),
    )));
  }
}
