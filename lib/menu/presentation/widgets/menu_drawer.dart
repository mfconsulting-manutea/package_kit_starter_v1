import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';

class MenuDrawer extends StatelessWidget {
  final ConfigApp configApp;
  final bool showLogoText;
  final TextStyle? logoTextStyle;
  final Widget menus;

  const MenuDrawer({
    Key? key,
    required this.configApp,
    required this.showLogoText,
    this.logoTextStyle,
    required this.menus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 280, maxHeight: 100),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: showLogoText == true && configApp.logoText != null
                    ? Text(
                        configApp.logoText!,
                        style: logoTextStyle,
                        textAlign: TextAlign.center,
                      )
                    : Image.network(configApp.logoUrl!),
              ),
            ],
          ),
          const SizedBox(height: 20),
          menus,
        ],
      ),
    );
  }
}
