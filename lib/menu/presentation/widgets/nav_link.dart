import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/breakpoints/presentation/widgets/breakpoints.dart';
import 'package:package_kit_starter_v1/styles/presentation/widgets/global_text_theme.dart';

class NavLink extends StatelessWidget {
  final IconData? icon;
  final String label;
  final PageRouteInfo<dynamic> route;
  final bool? showTooltip;
  final bool? isDrawer;
  final MainAxisAlignment? rowMainAxisAlignment;
  final TextStyle? style;

  const NavLink({
    this.icon,
    required this.label,
    required this.route,
    this.showTooltip,
    this.isDrawer,
    this.rowMainAxisAlignment,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StackRouter router = context.router;
    bool breakpointsIsMobiles = Breakpoints.isMobileSmall(context) || Breakpoints.isMobileMedium(context) || Breakpoints.isMobileLarge(context);

    TextAlign textAlign = TextAlign.start;
    AlignmentGeometry containerAligment = Alignment.centerLeft;
    if (rowMainAxisAlignment == MainAxisAlignment.center) {
      textAlign = TextAlign.center;
      containerAligment = Alignment.center;
    }
    if (rowMainAxisAlignment == MainAxisAlignment.end) {
      textAlign = TextAlign.end;
      containerAligment = Alignment.centerRight;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDrawer == true ? 10 : 8, vertical: isDrawer != null && isDrawer == true ? 5 : 0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: rowMainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            if (rowMainAxisAlignment != MainAxisAlignment.end)
              if (icon != null)
                FaIcon(
                  icon,
                  size: 16,
                  color: isDrawer == true ? null : Colors.white,
                ),
            if (rowMainAxisAlignment != MainAxisAlignment.end)
              if (icon != null) const SizedBox(width: 10),

            //
            if (showTooltip != false) ...[
              Tooltip(
                message: label,
                child: Container(
                  alignment: containerAligment,
                  width: isDrawer == true ? 250 : null,
                  child: Text(
                    label,
                    /* style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDrawer == true ? null : Colors.white,
                    ), */
                    style: style ??
                        GlobalTextTheme.textTheme(context).bodyMedium!.copyWith(
                              color: isDrawer == true ? null : Colors.white,
                            ),
                    textAlign: textAlign,
                  ),
                ),
              ),
            ],
            if (showTooltip == false) ...[
              Container(
                alignment: containerAligment,
                width: isDrawer == true ? 250 : null,
                child: Text(
                  label,
                  /* style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDrawer == true ? null : Colors.white,
                    ), */
                  style: style ??
                      GlobalTextTheme.textTheme(context).bodyMedium!.copyWith(
                            color: isDrawer == true ? null : Colors.white,
                          ),
                  textAlign: textAlign,
                ),
              ),
            ],

            //
            if (rowMainAxisAlignment == MainAxisAlignment.end)
              if (icon != null) const SizedBox(width: 10),
            if (rowMainAxisAlignment == MainAxisAlignment.end)
              if (icon != null)
                FaIcon(
                  icon,
                  size: 16,
                  color: isDrawer == true ? null : Colors.white,
                ),
          ],
        ),
        onTap: () {
          router.push(route);
          router.pop();
        },
      ),
    );
  }
}
