import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './custom_template_view_model.dart';

class CustomTemplateView extends CustomTemplateViewModel {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                      Stack(
                        children: <Widget>[
                          Container(
                            width: screenSize.width,
                            height: 320,
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            color: Color(0xFFECECEC),
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/arsyad_cv.jpg",
                                )),
                          ),
                          Container(
                            width: screenSize.width,
                            height: 320,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.1, 2.1],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xFFFAFAFA),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Choose Theme Color",
                                style: TextStyle(
                                    fontFamily: "SFP_Text",
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: colors.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      width: 50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: colorSelected == colors[i] &&
                                                  colorsSelector[i]
                                              ? Border.all(
                                                  width: 2,
                                                  color: Color(colors[i]))
                                              : Border.all(
                                                  color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: RaisedButton(
                                        padding: EdgeInsets.zero,
                                        color: Color(colors[i]),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () => onChangeColors(i),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Select Font",
                                style: TextStyle(
                                    fontFamily: "SFP_Text",
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: Color(0xFFf1f2f6),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: currentCity,
                                    items: dropDownMenuItems,
                                    onChanged: changedDropDownItem,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
              ),
            )));
  }
}
