import 'package:flutter/material.dart';
import 'package:paperflix_rg/localization/app_translations.dart';

class FormPhone extends StatefulWidget {
  final TextEditingController controller;
  final String label, hint;
  final bool question;

  FormPhone({this.controller, this.label, this.question, this.hint});

  @override
  _FormPhoneState createState() => _FormPhoneState();
}

class _FormPhoneState extends State<FormPhone> {
  List countries = [
    {"code": '+62', 'name': 'Indonesia'},
    {"code": '+1', 'name': 'USA'},
    {"code": '+12', 'name': 'Indonesia'},
  ];

  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentCity;

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentCity = dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (var country in countries) {
      items.add(new DropdownMenuItem(
          value: country['code'],
          child: new Text(
            country['code'],
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          )));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      currentCity = selectedCity;
    });
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
                  value: currentCity,
                  items: dropDownMenuItems,
                  onChanged: changedDropDownItem,
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
              "${countries[0]['name']}",
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
