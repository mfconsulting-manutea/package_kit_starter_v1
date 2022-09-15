import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';

class SectionTile {
  BuildContext context;
  int flex;
  Widget child;
  Alignment? alignment;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Decoration? decoration;
  double? height;
  BoxConstraints? constraints;

  SectionTile({
    required this.context,
    required this.flex,
    required this.child,
    this.alignment,
    this.padding,
    this.margin,
    this.decoration,
    this.height,
    this.constraints,
  });

  Widget tile() {
    /* if (Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context)) {
      return Expanded(
        flex: flex,
        child: Container(
          alignment: alignment ?? Alignment.topLeft,
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          decoration: decoration ?? const BoxDecoration(),
          height: height,
          // constraints: constraints!,
          child: child,
        ),
      );
    } else {
      return Container(
        alignment: alignment ?? Alignment.topLeft,
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        decoration: decoration ?? const BoxDecoration(),
        child: child,
      );
    } */
    if (!Breakpoints.isMobileSmall(context) && !Breakpoints.isMobileMedium(context) && !Breakpoints.isMobileLarge(context)) {
      return Expanded(
        flex: flex,
        child: Container(
          alignment: alignment ?? Alignment.topLeft,
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          decoration: decoration ?? const BoxDecoration(),
          height: height,
          // constraints: constraints!,
          child: child,
        ),
      );
    }
    return Container(
      alignment: alignment ?? Alignment.topLeft,
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      decoration: decoration ?? const BoxDecoration(),
      child: child,
    );
  }
}
