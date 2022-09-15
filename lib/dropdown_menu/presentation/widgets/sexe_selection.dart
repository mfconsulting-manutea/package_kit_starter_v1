import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get sexeItems {
  List<DropdownMenuItem<String>> sexeMenuItems = const [
    DropdownMenuItem(
      value: "Homme",
      alignment: AlignmentDirectional.center,
      child: Text("Homme", textAlign: TextAlign.center),
    ),
    DropdownMenuItem(
      value: "Femme",
      alignment: AlignmentDirectional.center,
      child: Text("Femme", textAlign: TextAlign.center),
    ),
    DropdownMenuItem(
      value: "Autre",
      alignment: AlignmentDirectional.center,
      child: Text("Autre", textAlign: TextAlign.center),
    ),
  ];
  return sexeMenuItems;
}
