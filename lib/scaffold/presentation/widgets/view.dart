import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/responsive/presentation/widgets/global_container_padding.dart';
import 'package:package_kit_starter_v1/scaffold/presentation/widgets/footer.dart';

import 'header.dart';

class View {
  BuildContext context;
  ConfigApp configApp;
  ConfigHeader configHeader;
  ConfigFooter configFooter;
  bool? hideHeader;
  bool? disableHeaderSpaceAfter;
  bool? showIconEndDrawer;
  String? pageTitle;
  bool? showPageTitleInsteadOfLogo;
  bool? disableBodyPadding;
  bool? hideFooter;
  bool? disableFooterSpaceBefore;
  Widget body;

  View({
    required this.context,
    required this.configApp,
    required this.configHeader,
    required this.configFooter,
    required this.hideHeader,
    required this.disableHeaderSpaceAfter,
    required this.showIconEndDrawer,
    required this.pageTitle,
    required this.showPageTitleInsteadOfLogo,
    required this.disableBodyPadding,
    required this.hideFooter,
    required this.disableFooterSpaceBefore,
    required this.body,
  });

  Widget defaultView() {
    return Column(
      children: [
        // Header
        if (hideHeader != true)
          Header(
            configHeader: configHeader,
            configApp: configApp,
            spaceAfter: disableHeaderSpaceAfter == true ? 0 : null,
            showIconEndDrawer: showIconEndDrawer,
            pageTitle: pageTitle,
            showPageTitleInsteadOfLogo: showPageTitleInsteadOfLogo,
          ),

        Expanded(
          child: SingleChildScrollView(
            primary: true,
            physics: const ClampingScrollPhysics(),
            child: Scrollbar(
              child: Column(
                children: [
                  // Body
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: disableBodyPadding == true ? 0 : GlobalContainerPadding.paddingContainerHorizontal(context)),
                    child: body,
                  ),

                  // Footer
                  if (hideFooter != true && disableFooterSpaceBefore != false)
                    SizedBox(
                      height: Breakpoints.isDesktopLarge(context) || Breakpoints.isDesktopMedium(context) || Breakpoints.isDesktopSmall(context)
                          ? 100
                          : Breakpoints.isTablet(context)
                              ? 50
                              : 20,
                    ),
                  if (hideFooter != true)
                    if (!Breakpoints.isMobileSmall(context) && !Breakpoints.isMobileMedium(context) && !Breakpoints.isMobileLarge(context))
                      Footer(
                        configFooter: configFooter,
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget fixHeader({
    required int headerHeight,
    required int footerHeight,
    required StackRouter router,
  }) {
    return SingleChildScrollView(
      primary: true,
      physics: const ClampingScrollPhysics(),
      child: Scrollbar(
        child: Column(
          children: [
            // Header
            if (hideHeader != true)
              Header(
                configHeader: configHeader,
                configApp: configApp,
                spaceAfter: disableHeaderSpaceAfter == true ? 0 : null,
                showIconEndDrawer: showIconEndDrawer,
                pageTitle: pageTitle,
                showPageTitleInsteadOfLogo: showPageTitleInsteadOfLogo,
              ),

            // Body
            Container(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - headerHeight - footerHeight - 200),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: disableBodyPadding == true ? 0 : GlobalContainerPadding.paddingContainerHorizontal(context)),
                child: body,
              ),
            ),

            // Footer
            if (hideFooter != true || disableFooterSpaceBefore != false)
              SizedBox(
                height: Breakpoints.isDesktopLarge(context) || Breakpoints.isDesktopMedium(context) || Breakpoints.isDesktopSmall(context)
                    ? 100
                    : Breakpoints.isTablet(context)
                        ? 50
                        : 20,
              ),
            if (hideFooter != true)
              if (!Breakpoints.isMobileSmall(context) && !Breakpoints.isMobileMedium(context) && !Breakpoints.isMobileLarge(context))
                Footer(
                  configFooter: configFooter,
                ),
          ],
        ),
      ),
    );
  }
}
