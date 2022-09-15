import 'package:flutter/material.dart';

/**
 * SCREEN SIZES (portrait)
 * 
 * iPhone SE = 375 x 667
 * iPhone 6/7/8 Plus = 414 x 736
 * iPhone X = 375 x 812
 * iPhone 12 Pro = 390 x 844
 * 
 * iPad mini = 768 x 1024
 * iPad Air = 820 x 1180
 * iPad Pro = 1024 x 1366
 * 
 */

/**
 * SCREEN SIZES (landscape)
 * 
 * Screen 9.0 = 1280 x 768
 * Screen 10.0 Retina = 2160 x 3840
 * Screen 12.0 Retina = 2304 x 1440
 * Screen 13.3 Retina = 2560 x 1600
 * Screen 15.4 Retina = 2880 x 1800
 * Screen 24.0 = 1920 x 1080
 * Screen 27.0 = 2560 x 1440
 * Screen 27.0 Retina = 5120 x 2880
 * 
 */

///

class Breakpoints extends StatelessWidget {
  final Widget? mobile;
  final Widget? mobileSmall;
  final Widget? mobileMedium;
  final Widget? mobileLarge;
  final Widget? tabletSmall;
  final Widget? tabletMedium;
  final Widget? tabletLarge;
  final Widget? desktop;
  final Widget? desktopSmall;
  final Widget? desktopMedium;
  final Widget? desktopLarge;

  final Widget? tablet;

  const Breakpoints({
    Key? key,
    this.mobile,
    this.mobileSmall,
    this.mobileMedium,
    this.mobileLarge,
    this.tabletSmall,
    this.tabletMedium,
    this.tabletLarge,
    this.desktop,
    this.desktopSmall,
    this.desktopMedium,
    this.desktopLarge,
    this.tablet,
  }) : super(key: key);

  // static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 320 && MediaQuery.of(context).size.width >= 767;
  static bool isMobileSmall(BuildContext context) => MediaQuery.of(context).size.width <= 320;
  static bool isMobileMedium(BuildContext context) => MediaQuery.of(context).size.width <= 375 && MediaQuery.of(context).size.width >= 321;
  static bool isMobileLarge(BuildContext context) => MediaQuery.of(context).size.width <= 767 && MediaQuery.of(context).size.width >= 375;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width <= 1023 && MediaQuery.of(context).size.width >= 768;

  // static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width <= 1024 && MediaQuery.of(context).size.width >= 2561;
  static bool isDesktopSmall(BuildContext context) => MediaQuery.of(context).size.width <= 1439 && MediaQuery.of(context).size.width >= 1024;
  static bool isDesktopMedium(BuildContext context) => MediaQuery.of(context).size.width <= 2559 && MediaQuery.of(context).size.width >= 1440;
  static bool isDesktopLarge(BuildContext context) => MediaQuery.of(context).size.width >= 2560;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    /* if (_size.width >= 2560 && _size.width <= 1440) {
      return desktop!;
    } else  */
    if (_size.width >= 2561) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("desktopLarge");
      return desktopLarge!;
    } else if (_size.width >= 1441) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("desktopMedium");
      return desktopMedium!;
    } else if (_size.width >= 1025) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("desktopSmall");
      return desktopSmall!;
    } else if (_size.width >= 769) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("tablet");
      return tablet!;
    } /* else if (_size.width >= 320 && _size.width <= 767) {
      return mobile!;
    }  */
    else if (_size.width >= 376) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("mobileLarge");
      return mobileLarge!;
    } else if (_size.width >= 321) {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("mobileMedium");
      return mobileMedium!;
    } else {
      // if(GlobalSettingsSharedPreferences.showDebug()!)print(print("mobileSmall");
      return mobileSmall!;
    }
  }
}
