import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paperflix_rg/localization/app_translations.dart';

class FormPhone extends StatefulWidget {
  final TextEditingController controller;
  final String label, hint;
  final bool question;
  final onChange;

  FormPhone(
      {this.controller, this.label, this.question, this.hint, this.onChange});

  @override
  _FormPhoneState createState() => _FormPhoneState();
}

class _FormPhoneState extends State<FormPhone> {
  final db = Firestore.instance;

  List<DropdownMenuItem<Map>> dropDownMenuCode;
  Map currentCode;

  @override
  void initState() {
    dropDownMenuCode = getDropDownMenuItems();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // print(data);
    });
  }

  List<DropdownMenuItem<Map>> getDropDownMenuItems() {
    List<DropdownMenuItem<Map>> items = List();
    try {
      db.collection("countries_code").getDocuments().then((data) {
        if (data.documents.length > 0) {
          print(data.documents[0].data);
          for (var country in data.documents) {
            items.add(new DropdownMenuItem(
                value: country.data,
                child: new Text(
                  "+${country.data['code']}",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )));
          }
          setState(() {
            currentCode = data.documents[0].data;
            widget.onChange("+${data.documents[0].data['code']}");
          });
        } else {
          print("Error fetch countries_code");
        }
      });
    } catch (e) {
      print(e.toString());
    }

    return items;
  }

  void changedDropDownCode(Map selectedCode) {
    setState(() {
      currentCode = selectedCode;
    });
    widget.onChange(selectedCode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          "${widget.label}",
          style: TextStyle(
              fontFamily: "SFP_Text",
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color(0xFF2f3542)),
        ),
        SizedBox(height: 7),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15, right: 5),
              width: 75,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Color(0xFF2f3542),
              ),
              child: DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: currentCode,
                  items: dropDownMenuCode,
                  onChanged: changedDropDownCode,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color(0xFFf1f2f6),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2F3542),
                      fontWeight: FontWeight.w500,
                    ),
                    controller: widget.controller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFced6e0),
                      hintText: "${widget.hint}",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "SFP_Text",
                        color: Color(0xFF9D9D9D),
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              "${AppTranslations.of(context).text("country-code")}: ",
              style: TextStyle(
                  fontFamily: "SFP_Text",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Text(
              "${currentCode != null ? currentCode['name'] : ""}",
              style: TextStyle(
                  fontFamily: "SFP_Text",
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
