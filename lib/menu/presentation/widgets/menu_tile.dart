import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_kit_starter_v1/styles/presentation/widgets/global_text_theme.dart';

Widget menuTile(
  BuildContext context, {
  bool? isDrawer,
  IconData? icon,
  required String label,
  PageRouteInfo<dynamic>? navigate,
  bool? toLogout,
  Function? functionToLogout,
  MainAxisAlignment? rowMainAxisAlignment,
}) {
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
                style: GlobalTextTheme.textTheme(context).bodyMedium!.copyWith(
                      color: isDrawer == true ? null : Colors.white,
                    ),
                textAlign: textAlign,
              ),
            ),
          ),

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
        router.removeLast();

        toLogout != null ? functionToLogout!() : router.navigate(navigate!);
      },
    ),
  );
}
