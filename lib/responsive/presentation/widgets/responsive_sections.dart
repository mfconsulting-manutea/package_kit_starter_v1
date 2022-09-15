import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';
import 'package:package_kit_starter_v1/responsive/presentation/widgets/section_tile.dart';

class ResponsiveSections {
  BuildContext context;

  ResponsiveSections({
    required this.context,
  });

  Widget section2({
    bool? mobileRevertSection,
    required SectionTile leftTile,
    required SectionTile rightTile,
    MainAxisAlignment? mainAxisAlignment,
    double? mobileSizeBoxHeight,
    double? sizeBoxHeight,
  }) {
    /* if (Breakpoints.isMobileSmall(context) == true || Breakpoints.isMobileMedium(context) == true || Breakpoints.isMobileLarge(context) == true) {
      if (mobileRevertSection == true) {
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rightTile.tile(),
            SizedBox(height: mobileSizeBoxHeight ?? 20),
            leftTile.tile(),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftTile.tile(),
            SizedBox(height: mobileSizeBoxHeight ?? 20),
            rightTile.tile(),
          ],
        );
      }
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          rightTile.tile(),
        ],
      );
    } */
    if (!Breakpoints.isMobileSmall(context) || !Breakpoints.isMobileMedium(context) || !Breakpoints.isMobileLarge(context)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          rightTile.tile(),
        ],
      );
    } else {
      if (mobileRevertSection == true) {
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rightTile.tile(),
            SizedBox(height: mobileSizeBoxHeight ?? 20),
            leftTile.tile(),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftTile.tile(),
            SizedBox(height: mobileSizeBoxHeight ?? 20),
            rightTile.tile(),
          ],
        );
      }
    }
  }

  Widget section3({
    required SectionTile leftTile,
    required SectionTile centerTile,
    required SectionTile rightTile,
    MainAxisAlignment? mainAxisAlignment,
    double? mobileSizeBoxHeight,
    double? sizeBoxHeight,
  }) {
    /* if (Breakpoints.isMobileSmall(context) == true || Breakpoints.isMobileMedium(context) == true || Breakpoints.isMobileLarge(context) == true) {
      return Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(height: mobileSizeBoxHeight ?? 20),
          centerTile.tile(),
          SizedBox(height: mobileSizeBoxHeight ?? 20),
          rightTile.tile(),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          centerTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          rightTile.tile(),
        ],
      );
    } */

    if (!Breakpoints.isMobileSmall(context) || !Breakpoints.isMobileMedium(context) || !Breakpoints.isMobileLarge(context)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          centerTile.tile(),
          SizedBox(width: sizeBoxHeight ?? (Breakpoints.isTablet(context) ? 20 : 30)),
          rightTile.tile(),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftTile.tile(),
          SizedBox(height: mobileSizeBoxHeight ?? 20),
          centerTile.tile(),
          SizedBox(height: mobileSizeBoxHeight ?? 20),
          rightTile.tile(),
        ],
      );
    }
  }
}
