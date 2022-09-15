import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';

class ScaffoldViewContent extends StatefulWidget {
  final String title;
  final Widget child;
  final bool? isBackgroudColorWhite;
  final Color? scaffoldBackgroundColor;
  final Widget? widgetBottomSheet;

  const ScaffoldViewContent({
    Key? key,
    required this.title,
    required this.child,
    this.isBackgroudColorWhite,
    this.scaffoldBackgroundColor,
    this.widgetBottomSheet,
  }) : super(key: key);

  @override
  State<ScaffoldViewContent> createState() => _ScaffoldViewContentState();
}

class _ScaffoldViewContentState extends State<ScaffoldViewContent> {
  bool isHoverTitle = false;
  bool isHoverBackButton = false;

  @override
  Widget build(BuildContext context) {
    StackRouter router = context.router;

    bool breakpointsIsMobiles = Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context);
    bool breakpointsIsTablet = Breakpoints.isTablet(context);
    bool breakpointsIsDesktops = Breakpoints.isDesktopSmall(context) || Breakpoints.isDesktopMedium(context) || Breakpoints.isDesktopLarge(context);

    return Scaffold(
      backgroundColor: widget.isBackgroudColorWhite == true ? Colors.white : widget.scaffoldBackgroundColor ?? Theme.of(context).colorScheme.primary,
      bottomSheet: widget.widgetBottomSheet ?? const SizedBox(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                widget.child,
                const SizedBox(height: 50),
              ],
            ),
          ),
          // Icon Back
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    onHover: (value) {
                      setState(() {
                        isHoverBackButton = value;
                      });
                    },
                    onTap: () {
                      router.pop();
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: isHoverBackButton == false ? Colors.black.withOpacity(0.2) : Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(20)),
                      child: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      minWidth: MediaQuery.of(context).size.width - 20 - 65 - 10 - 10 - 5, // Witdh - Padding icon - Widht sepration - Padding title - 5
                      /* minWidth: 150,
                      maxWidth: Breakpoints.isMobileSmall(context)
                          ? 200
                          : Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context)
                              ? 250
                              : breakpointsIsTablet
                                  ? 600
                                  : 700, */
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(color: isHoverTitle == false ? Colors.black.withOpacity(0.2) : Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
