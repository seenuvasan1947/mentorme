import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

// const List<String> list = <String>['en', 'km', 'ja'];
// String dropdownValue = list.first;
// final FlutterLocalization localization = FlutterLocalization.instance;

// // ignore: non_constant_identifier_names
// DropdownButton<String> lang_select(
//   BuildContext context,
// ) {
//   return DropdownButton(
//     value: dropdownValue,
//     items: list.map<DropdownMenuItem<String>>((String value) {
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//     onChanged: (String? value) {
//       // This is called when the user selects an item.

//       dropdownValue = value!;

//       localization.translate(dropdownValue);
//     },
//   );
// }

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 166, 24, 194), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));
