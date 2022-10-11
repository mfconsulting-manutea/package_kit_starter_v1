import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavLink extends StatelessWidget {
  final IconData? icon;
  final String label;
  final PageRouteInfo<dynamic> route;
  final bool? showTooltip;
  final bool? isDrawer;
  final MainAxisAlignment? rowMainAxisAlignment;
  final TextStyle? style;
  final Color? textColor;
  final Color? iconColor;

  const NavLink({
    this.icon,
    required this.label,
    required this.route,
    this.showTooltip,
    this.isDrawer,
    this.rowMainAxisAlignment,
    this.style,
    this.textColor,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StackRouter router = context.router;

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
            if (rowMainAxisAlignment != MainAxisAlignment.end && icon != null) ...[
              FaIcon(
                icon,
                size: 16,
                color: iconColor ?? Colors.white,
              ),
              const SizedBox(width: 10)
            ],

            //
            if (showTooltip != false) ...[
              Tooltip(
                message: label,
                child: Container(
                  alignment: containerAligment,
                  // width: isDrawer == true ? 250 : null,
                  constraints: BoxConstraints(
                    maxWidth: isDrawer == true ? 250 : double.infinity,
                  ),
                  child: Text(
                    label,
                    style: style ?? Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor ?? Colors.white),
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
                  style: style ?? Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor ?? Colors.white),
                  textAlign: textAlign,
                ),
              ),
            ],

            //
            if (rowMainAxisAlignment == MainAxisAlignment.end && icon != null) ...[
              const SizedBox(width: 10),
              FaIcon(
                icon,
                size: 16,
                color: iconColor ?? Colors.white,
              ),
            ],
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
