import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';

class Footer extends StatelessWidget {
  final ConfigFooter configFooter;

  const Footer({
    required this.configFooter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return configFooter.contents ?? const SizedBox();
  }
}
