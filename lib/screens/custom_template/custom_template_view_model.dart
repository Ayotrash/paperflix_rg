import 'package:flutter/material.dart';
import './custom_template.dart';

abstract class CustomTemplateViewModel extends State<CustomTemplate> {
  // List fonts = [
  //   "SFP_Text",
  //   "Jomolhari",
  //   "McLaren",
  //   "Lato",
  //   "Open Sans",
  //   "Oswald"
  // ];
  final List colors = [
    0xFF1e90ff,
    0xFF2dd573,
    0xFFff4757,
    0xFFffa502,
    0xFF747d8c
  ];
  List<bool> colorsSelector = List.generate(100, (i) => false);
  int colorSelected = 0xFF1e90ff;

  // List<DropdownMenuItem<String>> dropDownMenuItems;
  // String currentFont = 'SFP_Text';

  @override
  void initState() {
    // dropDownMenuItems = getDropDownMenuItems();
    // currentFont = dropDownMenuItems[0].value;
    super.initState();
  }

  void onChangeColors(int i) {
    setState(() {
      colorsSelector = List.generate(100, (i) => false);
      colorsSelector[i] = true;
      colorSelected = colors[i];
    });
  }

  // List<DropdownMenuItem<String>> getDropDownMenuItems() {
  //   List<DropdownMenuItem<String>> items = new List();
  //   for (String font in fonts) {
  //     items.add(new DropdownMenuItem(
  //         value: font,
  //         child: new Text(
  //           font,
  //           style: TextStyle(color: Color(0xFF2f3542)),
  //         )));
  //   }
  //   return items;
  // }

  // void changedDropDownItem(String selectedFont) {
  //   setState(() {
  //     currentFont = selectedFont;
  //   });
  // }
}
