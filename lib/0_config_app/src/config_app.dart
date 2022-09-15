import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ConfigApp {
  ConfigHeader configHeader;
  ConfigFooter configFooter;

  //
  double? formBorderRadius;
  double? buttonBorderRadius;
  double? globalBorderRaidus;
  List<Color>? loadingIndicatorColors;
  Indicator? loadingIndicatorType;
  int? loadingIndicatorDurationSecond;
  BoxDecoration? componentUserNotLogged;

  bool? showPageTitleInTab;
  String? titleApp;
  String? titleSeparatorName;
  String? logoUrl;
  String? logoText;
  TextStyle? logoTextStyle;
  bool? showLogoTextInsteadOfUrl;
  Widget? drawer;
  Widget? endDrawer;
  // Widget? bottomNavigationBar;
  String? underMaintenanceImageUrl;
  String? underMaintenanceTitle;
  String? underMaintenanceDescription;
  String? underConstructionImageUrl;
  String? underConstructionTitle;
  String? underConstructionDescription;

  ConfigApp({
    required this.configHeader,
    required this.configFooter,

    //
    this.formBorderRadius,
    this.buttonBorderRadius,
    this.globalBorderRaidus,
    this.loadingIndicatorColors,
    this.loadingIndicatorType,
    this.loadingIndicatorDurationSecond,
    this.componentUserNotLogged,
    this.showPageTitleInTab,
    this.titleApp,
    this.titleSeparatorName,
    this.logoUrl =
        "https://directus.weblifestarter.com/assets/846a7300-8dc9-45ca-ab87-9751692d3e85?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImY3YmZkMmQyLTg0YTEtNDcyZi1iODc0LTc1MDQ1OTk2OGUzMSIsInJvbGUiOiI3ZmViMDBlZS1iZDlmLTRlODQtYjczNS1iN2IyZmM1M2E2YTMiLCJhcHBfYWNjZXNzIjoxLCJhZG1pbl9hY2Nlc3MiOjEsImlhdCI6MTY1NzE1NjcxNCwiZXhwIjoxNjg4NjkyNzE0LCJpc3MiOiJkaXJlY3R1cyJ9.kdoWIO7akjfzpNn3bf8ivwQZabO_nZnyLS_T6ugO7HY",
    this.logoText,
    this.logoTextStyle,
    this.showLogoTextInsteadOfUrl,
    this.drawer,
    this.endDrawer,
    // this.bottomNavigationBar,
    this.underMaintenanceImageUrl =
        "https://directus.weblifestarter.com/assets/d310a767-6486-4a1f-8777-cde6a2242531?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImY3YmZkMmQyLTg0YTEtNDcyZi1iODc0LTc1MDQ1OTk2OGUzMSIsInJvbGUiOiI3ZmViMDBlZS1iZDlmLTRlODQtYjczNS1iN2IyZmM1M2E2YTMiLCJhcHBfYWNjZXNzIjoxLCJhZG1pbl9hY2Nlc3MiOjEsImlhdCI6MTY2MDc0ODU2OSwiZXhwIjoxNjkyMjg0NTY5LCJpc3MiOiJkaXJlY3R1cyJ9.4EwxGeR82AFSX_G_WSvusjc_TB6O0R2nRTv2uXTq5Qc",
    this.underMaintenanceTitle,
    this.underMaintenanceDescription,
    this.underConstructionImageUrl =
        "https://directus.weblifestarter.com/assets/70cec082-d8d4-4d62-b55e-5005e5514f80?access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImY3YmZkMmQyLTg0YTEtNDcyZi1iODc0LTc1MDQ1OTk2OGUzMSIsInJvbGUiOiI3ZmViMDBlZS1iZDlmLTRlODQtYjczNS1iN2IyZmM1M2E2YTMiLCJhcHBfYWNjZXNzIjoxLCJhZG1pbl9hY2Nlc3MiOjEsImlhdCI6MTY2MDc0ODU2OSwiZXhwIjoxNjkyMjg0NTY5LCJpc3MiOiJkaXJlY3R1cyJ9.4EwxGeR82AFSX_G_WSvusjc_TB6O0R2nRTv2uXTq5Qc",
    this.underConstructionTitle,
    this.underConstructionDescription,
  });
}

class ConfigHeader {
  double? height;
  double? width;
  Color? color;
  IconData? iconDrawer;
  bool? showIconDrawerTablet;
  bool? showIconDrawerDesktop;
  MainAxisAlignment? rowMainAxisAlignment;
  bool? showLogo;
  double? logoWidthMobiles;
  double? logoWidthTablet;
  double? logoWidthDesktops;
  // double? logoHeightMobiles;
  // double? logoHeightTablet;
  // double? logoHeightDesktops;
  bool? addSpacerAfterLogo;
  Widget? contents;

  ConfigHeader({
    this.height,
    this.width,
    this.color,
    this.iconDrawer,
    this.showIconDrawerTablet,
    this.showIconDrawerDesktop,
    this.rowMainAxisAlignment,
    this.showLogo,
    this.logoWidthMobiles,
    this.logoWidthTablet,
    this.logoWidthDesktops,
    // this.logoHeightMobiles,
    // this.logoHeightTablet,
    // this.logoHeightDesktops,
    this.addSpacerAfterLogo,
    this.contents,
  });
}

class ConfigFooter {
  Widget? contents;

  ConfigFooter({
    this.contents,
  });
}
