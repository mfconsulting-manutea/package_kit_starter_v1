import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:package_kit_starter_v1/animated_loading_indicator/presentation/widgets/animated_loading_indicator.dart';
import 'package:package_kit_starter_v1/scaffold/presentation/widgets/view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';
import 'package:package_kit_starter_v1/connectivity/business_logic/cubit/connectivity_cubit.dart';
import 'package:package_kit_starter_v1/languages/fr_language.dart';

class ScaffoldCustomized extends StatefulWidget {
  final ConfigApp configApp;
  final bool isUnderMaintenance;
  final bool isUnderConstruction;
  final String pageTitle;
  final bool? needToBeLogged;
  final bool? hideHeader;
  final bool? hideFooter;
  final bool? disableBodyPadding;
  final bool? disableHeaderSpaceAfter;
  final bool? disableFooterSpaceBefore;
  final bool? fixHeader;
  final Widget? bottomNavigationBar;
  final PageRouteInfo<dynamic>? routeUserNotLogged;
  // final Drawer? drawer;
  final bool? showIconEndDrawer;
  final bool? showPageTitleInsteadOfLogo;
  final Widget body;

  const ScaffoldCustomized({
    required this.configApp,
    required this.isUnderMaintenance,
    required this.isUnderConstruction,
    required this.pageTitle,
    this.needToBeLogged,
    this.hideHeader,
    this.hideFooter,
    this.disableBodyPadding,
    this.disableHeaderSpaceAfter,
    this.disableFooterSpaceBefore,
    this.fixHeader,
    this.bottomNavigationBar,
    this.routeUserNotLogged,
    // this.drawer,
    this.showIconEndDrawer,
    this.showPageTitleInsteadOfLogo,
    required this.body,
    super.key,
  });

  @override
  State<ScaffoldCustomized> createState() => _ScaffoldCustomizedState();
}

class _ScaffoldCustomizedState extends State<ScaffoldCustomized> {
  Future<void> setApplicationSwitcherDescription(ApplicationSwitcherDescription app) async {
    await SystemChannels.platform.invokeMethod<void>(
      'SystemChrome.setApplicationSwitcherDescription',
      <String, dynamic>{
        'label': app.label,
        'primaryColor': app.primaryColor,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<ConnectivityCubit>().checkConnectivity();

    StackRouter router = context.router;

    if (widget.pageTitle.isNotEmpty) {
      setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: widget.configApp.showPageTitleInTab == true ? "${widget.configApp.titleApp} ${widget.configApp.titleSeparatorName} ${widget.pageTitle}" : "${widget.configApp.titleApp}",
          primaryColor: Theme.of(context).primaryColor.value,
        ),
      );
    }

    int headerHeight = 100;
    int footerHeight = Breakpoints.isDesktopLarge(context) || Breakpoints.isDesktopMedium(context) || Breakpoints.isDesktopSmall(context)
        ? 100
        : Breakpoints.isTablet(context)
            ? 50
            : 20;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        drawer: widget.configApp.drawer,
        endDrawer: widget.configApp.endDrawer,
        body: SafeArea(
          child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
            listener: (context, state) {
              if (state is ConnectivityLoading) {}
              if (state is ConnectivityFailure) {}
            },
            builder: (context, state) {
              if (state is ConnectivityInitial) {
                context.watch<ConnectivityCubit>().checkConnectivity();
              }
              if (state is ConnectivityLoading) {
                return Center(
                    child: AnimatedLoadingIndicator(
                  configApp: widget.configApp,
                ));
              }
              if (state is ConnectivityFailure) {
                return Center(
                  child: Text(
                    "Aucune connexion, impossible de charger le contenu",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              }

              if (widget.isUnderConstruction == true) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 250,
                          child: Image.network(
                            widget.configApp.underConstructionImageUrl!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              widget.configApp.underConstructionTitle ?? LanguageFr.underConstructionTitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.configApp.underConstructionDescription ?? LanguageFr.underConstructionDescription,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),

                            //
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                  Uri.parse("https://weblifestarter.com"),
                                  mode: LaunchMode.inAppWebView,
                                  // webViewConfiguration: const WebViewConfiguration(headers: <String, String>{'my_header_key': 'my_header_value'}),
                                );
                              },
                              child: Text(
                                LanguageFr.textByWeblifestarter,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (widget.isUnderMaintenance == true) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 250,
                          child: Image.network(
                            widget.configApp.underMaintenanceImageUrl!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              widget.configApp.underConstructionTitle ?? LanguageFr.underMaintenanceTitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.configApp.underConstructionDescription ?? LanguageFr.underMaintenanceDescription,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              // return widget.fixHeader != true ? fixHeader(headerHeight: headerHeight, footerHeight: footerHeight, router: router) : header(router: router);
              return widget.fixHeader == true
                  ? View(
                      context: context,
                      configApp: widget.configApp,
                      configHeader: widget.configApp.configHeader,
                      configFooter: widget.configApp.configFooter,
                      hideHeader: widget.hideHeader,
                      disableHeaderSpaceAfter: widget.disableHeaderSpaceAfter,
                      showIconEndDrawer: widget.showIconEndDrawer,
                      pageTitle: widget.pageTitle,
                      showPageTitleInsteadOfLogo: widget.showPageTitleInsteadOfLogo,
                      disableBodyPadding: widget.disableBodyPadding,
                      hideFooter: widget.hideFooter,
                      disableFooterSpaceBefore: widget.disableFooterSpaceBefore,
                      body: widget.body,
                    ).fixHeader(
                      headerHeight: headerHeight,
                      footerHeight: footerHeight,
                      router: router,
                    )
                  : View(
                      context: context,
                      configApp: widget.configApp,
                      configHeader: widget.configApp.configHeader,
                      configFooter: widget.configApp.configFooter,
                      hideHeader: widget.hideHeader,
                      disableHeaderSpaceAfter: widget.disableHeaderSpaceAfter,
                      showIconEndDrawer: widget.showIconEndDrawer,
                      pageTitle: widget.pageTitle,
                      showPageTitleInsteadOfLogo: widget.showPageTitleInsteadOfLogo,
                      disableBodyPadding: widget.disableBodyPadding,
                      hideFooter: widget.hideFooter,
                      disableFooterSpaceBefore: widget.disableFooterSpaceBefore,
                      body: widget.body,
                    ).defaultView();
            },
          ),
        ),
      ),
    );
  }
}
