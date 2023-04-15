import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

class LangSelect extends StatefulWidget {
  const LangSelect({super.key});

  @override
  State<LangSelect> createState() => _LangSelectState();
}

// List<String> list = <String>['en', 'km', 'ja'];

class _LangSelectState extends State<LangSelect> {
  // String dropdownValue = list.first;
  final FlutterLocalization localization = FlutterLocalization.instance;

  String value = 'en';
  
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'en', title: 'en'),
    S2Choice<String>(value: 'tm', title: 'tm'),
    S2Choice<String>(value: 'hi', title: 'hi'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close))
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmartSelect.single(

                selectedValue: value,
                title: 'Language',
                choiceItems: options,
                onChange: (state) => setState(() {
                      value = state.value;
                      localization.translate(value);
                      Navigator.pop(context);
                    })),
          ],
        ),
      ),
    );
  }
}


/* 
DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
                localization.translate(dropdownValue);
                Navigator.pop(context);
              },
            ), */