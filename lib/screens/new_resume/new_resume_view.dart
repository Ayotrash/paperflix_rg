import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/moment.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/form_text.dart';
import 'package:paperflix_rg/screens/new_resume/widgets/single_form.dart';
import './new_resume_view_model.dart';

class NewResumeView extends NewResumeViewModel {
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
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFFFAFAFA),
            automaticallyImplyLeading: false,
            title: Text("Create New Resume",
                style: TextStyle(
                  fontFamily: "SFP_Text",
                )),
            actions: <Widget>[
              FlatButton(
                onPressed: () {},
                textColor: Color(0xFFff4757),
                child: Text("Skip",
                    style: TextStyle(
                      fontFamily: "SFP_Text",
                    )),
              )
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
                SizedBox(height: 15),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: <Widget>[
                //     SizedBox(width: 25),
                //     Stack(
                //       children: <Widget>[
                //         Container(
                //           width: 150,
                //           color: Colors.transparent,
                //         ),
                //         Positioned(
                //           left: 0,
                //           top: 22.5,
                //           child: Container(
                //             width: 150,
                //             height: 7,
                //             color: Colors.red,
                //           ),
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: <Widget>[
                //             Container(
                //               width: 50,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                   color: Color(0xFF2ed573),
                //                   borderRadius: BorderRadius.circular(50)),
                //               child: Icon(Icons.person, color: Colors.white),
                //             ),
                //             SizedBox(height: 10),
                //             Text("Personal",
                //                 style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w700,
                //                   fontFamily: "SFP_Text",
                //                 )),
                //             Text("Information",
                //                 style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w700,
                //                   fontFamily: "SFP_Text",
                //                 )),
                //           ],
                //         )
                //       ],
                //     ),
                //   ],
                // )
                Container(
                  width: screenSize.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SingleForm(label: "Full Name", value: "Arsyad Ramadhan"),
                      SingleForm(label: "Gender", value: "Male"),
                      SingleForm(
                          label: "Email", value: "blacklistdark1987@gmail.com"),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              "Birth Date",
                              style: TextStyle(
                                  fontFamily: "SFP_Text",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Color(0xFF2f3542)),
                            ),
                            SizedBox(height: 7),
                            RaisedButton(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Color(0xFFf1f2f6),
                              textColor: Color(0xFF2F3542),
                              onPressed: () => selectDate(context),
                              child: Text(
                                  "${Moment(selectedDate).format('MMM dd, yyyy HH:mm')}"),
                            ),
                          ]),
                      FormText(
                        label: "Birth of Date",
                        hint: "Select Date",
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    ));
  }
}
