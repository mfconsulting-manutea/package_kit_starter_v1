import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/responsive/presentation/widgets/global_container_padding.dart';

class Header extends StatelessWidget {
  final ConfigApp configApp;
  final ConfigHeader configHeader;
  final double? spaceAfter;
  final bool? showIconEndDrawer;
  final String? pageTitle;
  final bool? showPageTitleInsteadOfLogo;

  const Header({
    required this.configApp,
    required this.configHeader,
    this.spaceAfter,
    this.showIconEndDrawer,
    this.pageTitle,
    this.showPageTitleInsteadOfLogo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String logoUrl = configApp.logoUrl!;
    Size size = MediaQuery.of(context).size;

    bool breakpointsIsMobiles = Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context);
    bool breakpointsIsTablet = Breakpoints.isTablet(context);
    bool breakpointsIsDesktops = Breakpoints.isDesktopLarge(context) || Breakpoints.isDesktopMedium(context) || Breakpoints.isDesktopSmall(context);

    bool showLogo = configHeader.showLogo ?? false;
    bool addSpacerAfterLogo = configHeader.addSpacerAfterLogo ?? false;

    bool showIconDrawer = false;
    if (breakpointsIsMobiles) {
      showIconDrawer = true;
    }
    if (breakpointsIsTablet) {
      showIconDrawer = configHeader.showIconDrawerTablet ?? false;
    }
    if (breakpointsIsDesktops) {
      showIconDrawer = configHeader.showIconDrawerDesktop ?? false;
    }

    double logoContainerWidth = 0.0;
    if (breakpointsIsMobiles) {
      if (configHeader.logoWidthMobiles != null && configHeader.logoWidthMobiles! <= size.width - 10) {
        logoContainerWidth = configHeader.logoWidthMobiles!;
      } else {
        // logoContainerWidth = 200;
        logoContainerWidth = size.width - 100;
      }
    }
    if (breakpointsIsTablet) {
      if (configHeader.logoWidthTablet != null && configHeader.logoWidthTablet! <= size.width) {
        logoContainerWidth = configHeader.logoWidthTablet!;
      } else {
        logoContainerWidth = 200;
      }
    }
    if (breakpointsIsDesktops) {
      if (configHeader.logoWidthDesktops != null && configHeader.logoWidthDesktops! <= size.width) {
        logoContainerWidth = configHeader.logoWidthDesktops!;
      } else {
        logoContainerWidth = 200;
      }
    }

    String title = "";
    if (!breakpointsIsDesktops) {
      if (showPageTitleInsteadOfLogo == true) {
        title = pageTitle ?? "";
      } else {
        title = configApp.logoText ?? "";
      }
    }
    if (breakpointsIsDesktops) {
      title = configApp.logoText ?? "";
    }

    return Column(
      children: [
        Container(
          height: configHeader.height ?? 100,
          width: configHeader.width ?? size.width,
          constraints: BoxConstraints(maxWidth: size.width),
          color: configHeader.color ?? Theme.of(context).colorScheme.primary,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(horizontal: GlobalContainerPadding.paddingContainerHorizontal(context)),
          child: Row(
            mainAxisAlignment: configHeader.rowMainAxisAlignment ?? (showIconEndDrawer == true ? MainAxisAlignment.end : MainAxisAlignment.start),
            children: [
              if (showIconEndDrawer != true)
                if (showIconDrawer == true)
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: FaIcon(
                          configHeader.iconDrawer ?? FontAwesomeIcons.bars,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              if (showIconEndDrawer != true)
                if (showIconDrawer == true) const SizedBox(width: 20),

              // Logo URL || PageTitle
              Row(
                mainAxisAlignment: breakpointsIsMobiles ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: logoContainerWidth,
                    alignment: Alignment.center,
                    child: configApp.showLogoTextInsteadOfUrl == true || showPageTitleInsteadOfLogo == true
                        ? Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  inherit: configApp.logoTextStyle!.inherit,
                                  color: configApp.logoTextStyle!.color,
                                  backgroundColor: configApp.logoTextStyle!.backgroundColor,
                                  fontSize: configApp.logoTextStyle!.fontSize,
                                  fontWeight: configApp.logoTextStyle!.fontWeight,
                                  fontStyle: configApp.logoTextStyle!.fontStyle,
                                  letterSpacing: configApp.logoTextStyle!.letterSpacing,
                                  wordSpacing: configApp.logoTextStyle!.wordSpacing,
                                  textBaseline: configApp.logoTextStyle!.textBaseline,
                                  height: configApp.logoTextStyle!.height,
                                  leadingDistribution: configApp.logoTextStyle!.leadingDistribution,
                                  locale: configApp.logoTextStyle!.locale,
                                  foreground: configApp.logoTextStyle!.foreground,
                                  background: configApp.logoTextStyle!.background,
                                  shadows: configApp.logoTextStyle!.shadows,
                                  fontFeatures: configApp.logoTextStyle!.fontFeatures,
                                  decoration: configApp.logoTextStyle!.decoration,
                                  decorationColor: configApp.logoTextStyle!.decorationColor,
                                  decorationStyle: configApp.logoTextStyle!.decorationStyle,
                                  decorationThickness: configApp.logoTextStyle!.decorationThickness,
                                  debugLabel: configApp.logoTextStyle!.debugLabel,
                                  fontFamily: configApp.logoTextStyle!.fontFamily,
                                  fontFamilyFallback: configApp.logoTextStyle!.fontFamilyFallback,
                                  overflow: configApp.logoTextStyle!.overflow,
                                ),
                          )
                        : configApp.logoUrl != null
                            ? Image.network(logoUrl)
                            : const SizedBox(),
                  ),
                ],
              ),

              //
              if (showIconDrawer == false) addSpacerAfterLogo == true ? const Spacer() : const SizedBox(width: 20),
              if (showIconDrawer == false) configHeader.contents ?? const SizedBox(),
              if (showIconDrawer == false) const SizedBox(width: 20),

              //
              // if (showIconEndDrawer != true)
              //   if (showIconDrawer == true) const SizedBox(width: 20),
              if (showIconEndDrawer == true)
                if (showIconDrawer == true)
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        print("openEndDrawer");
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: FaIcon(
                          configHeader.iconDrawer ?? FontAwesomeIcons.bars,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),

        // Spacer
        SizedBox(height: spaceAfter ?? 50),
      ],
    );
  }
}
