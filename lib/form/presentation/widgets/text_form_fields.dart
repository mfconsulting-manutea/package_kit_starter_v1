import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';

Widget textFormField({
  required ConfigApp configApp,
  double? padding,
  BoxDecoration? decoration,
  double? maxWidth,
  double? maxHeight,
  BorderSide? borderSide,
  BorderRadius? borderRadius,
  bool? isDarkTheme,
  Key? key,
  TextEditingController? controller,
  required TextInputType keyboardType,
  required TextInputAction textInputAction,
  List<TextInputFormatter>? inputFormatters,
  int? maxLines,
  String? initialValue,
  required String labelText,
  bool? isMandatory,
  bool? readOnly,
  bool? obscureText,
  Widget? suffixIcon,
  required Function validator,
  required Function onChanged,
  required Function onFieldSubmitted,
}) {
  /* Key? keyNull;
  TextEditingController? controllerNull;
  if (key == null && controller == null) {
    keyNull = const Key("keyNull");
    controllerNull = TextEditingController();
  } */

  return Container(
    padding: EdgeInsets.all(padding ?? 10),
    decoration: decoration ?? const BoxDecoration(),
    constraints: BoxConstraints(
      minWidth: 50,
      maxWidth: maxWidth ?? 300,
      maxHeight: maxHeight ?? 300,
    ),
    child: TextFormField(
      key: key,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      initialValue: initialValue,
      style: TextStyle(
        /* color: readOnly
            ? isDarkTheme == true
                ? Colors.white
                : Colors.grey.shade500
            : null, */
        color: isDarkTheme == true
            ? Colors.white
            : readOnly ?? false
                ? Colors.grey.shade500
                : null,
      ),
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: isMandatory ?? false ? "$labelText*" : labelText,
        labelStyle: TextStyle(
          color: isDarkTheme == true
              ? Colors.white
              : readOnly ?? false
                  ? Colors.grey.shade500
                  : null,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ?? const BorderSide(),
          borderRadius: borderRadius ?? BorderRadius.circular(configApp.formBorderRadius!),
        ),
        border: OutlineInputBorder(
          borderSide: borderSide ?? const BorderSide(),
          borderRadius: borderRadius ?? BorderRadius.circular(configApp.formBorderRadius!),
        ),
        filled: readOnly,
        /* fillColor: readOnly
            ? isDarkTheme == true
                ? Colors.white
                : Colors.grey.shade200
            : null, */
        fillColor: isDarkTheme == true
            ? Colors.white
            : readOnly ?? false
                ? Colors.grey.shade200
                : null,
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      validator: (validatorValue) => validator(validatorValue),
      onChanged: (onChangedValue) => onChanged(onChangedValue),
      onFieldSubmitted: (onFieldSubmittedValue) => onFieldSubmitted(onFieldSubmittedValue),
    ),
  );
}
