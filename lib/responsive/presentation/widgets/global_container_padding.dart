import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';

class GlobalContainerPadding {
  static double paddingContainer = 20;

  static double paddingContainerHorizontal(context) {
    return Breakpoints.isDesktopLarge(context)
        ? 100
        : Breakpoints.isDesktopMedium(context)
            ? 40
            : Breakpoints.isDesktopSmall(context)
                ? 20
                : Breakpoints.isTablet(context)
                    ? 15
                    : 10;
  }

  static double marginContainer = 20;
  static double marginContainerHorizontal = 100;
}
