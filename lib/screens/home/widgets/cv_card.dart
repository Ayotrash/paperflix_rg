import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paperflix_rg/localization/app_translations.dart';

class CVCard extends StatefulWidget {
  final String image, name, lastUpdate;

  CVCard({this.image, this.name, this.lastUpdate});

  @override
  _CVCardState createState() => _CVCardState();
}

class _CVCardState extends State<CVCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: widget.image,
            imageBuilder: (context, imageProvider) => Container(
              width: screenSize.width / 2,
              height: 500,
              margin: EdgeInsets.only(bottom: 15, right: 5, left: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: imageProvider)),
              child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  textColor: Color(0xFF57606f),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            // gradient: LinearGradient(
                            //   // Where the linear gradient begins and ends
                            //   begin: Alignment.topRight,
                            //   end: Alignment.bottomLeft,
                            //   // Add one stop for each color. Stops should increase from 0 to 1
                            //   stops: [0.1, 2.1],
                            //   colors: [
                            //     // Colors are easy thanks to Flutter's Colors class.
                            //     Colors.grey[800]
                            //         .withOpacity(0.3),
                            //     Colors.transparent,
                            //   ],
                            // ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                  color: Color(0xFF2dd573),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "SFP_Text",
                                  fontSize: 16),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "${AppTranslations.of(context).text("last-updated")} ${widget.lastUpdate}",
                              style: TextStyle(
                                  fontFamily: "SFP_Text", fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
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
          Positioned(
            top: 10,
            right: 15,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Color(0xFF2f3542).withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.file_download, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
