import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';

Widget buttonForm({
  bool? whiteBackground,
  required ConfigApp configApp,
  required String textButton,
  required IconData icon,
  required Function onPressed,
  double? paddingAll,
  double? heightButton,
  double? widthButton,
  ButtonStyle? buttonStyle,
  TextStyle? textStyle,
  Color? iconColor,
}) {
  return Padding(
    padding: EdgeInsets.all(paddingAll ?? 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightButton ?? 50,
          width: widthButton,
          child: ElevatedButton.icon(
            onPressed: () => onPressed(),
            icon: FaIcon(
              icon,
              color: iconColor ?? (whiteBackground == true ? null : Colors.white),
            ),
            style: buttonStyle ??
                ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(configApp.buttonBorderRadius!)),
                ),
            label: Text(
              textButton,
              textAlign: TextAlign.center,
              style: textStyle ??
                  TextStyle(
                    color: whiteBackground == true ? null : Colors.white,
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}
