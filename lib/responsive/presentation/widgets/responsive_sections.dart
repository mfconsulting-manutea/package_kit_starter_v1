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
    double? sizeBoxWidth,
  }) {
    return !Breakpoints.isMobileSmall(context) && !Breakpoints.isMobileMedium(context) && !Breakpoints.isMobileLarge(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftTile.tile(),
              SizedBox(
                width: sizeBoxWidth ??
                    (Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context)
                        ? 0
                        : Breakpoints.isTablet(context)
                            ? 20
                            : 30),
              ),
              rightTile.tile(),
            ],
          )
        : mobileRevertSection == true
            ? Column(
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  rightTile.tile(),
                  SizedBox(height: mobileSizeBoxHeight ?? 20),
                  leftTile.tile(),
                ],
              )
            : Column(
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leftTile.tile(),
                  SizedBox(height: mobileSizeBoxHeight ?? 20),
                  rightTile.tile(),
                ],
              );
  }

  Widget section3({
    required SectionTile leftTile,
    required SectionTile centerTile,
    required SectionTile rightTile,
    MainAxisAlignment? mainAxisAlignment,
    double? mobileSizeBoxHeight,
    double? sizeBoxWidth,
  }) {
    return !Breakpoints.isMobileSmall(context) && !Breakpoints.isMobileMedium(context) && !Breakpoints.isMobileLarge(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftTile.tile(),
              SizedBox(
                width: sizeBoxWidth ??
                    (Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context)
                        ? 0
                        : Breakpoints.isTablet(context)
                            ? 20
                            : 30),
              ),
              centerTile.tile(),
              SizedBox(
                width: sizeBoxWidth ??
                    (Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context)
                        ? 0
                        : Breakpoints.isTablet(context)
                            ? 20
                            : 30),
              ),
              rightTile.tile(),
            ],
          )
        : Column(
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
