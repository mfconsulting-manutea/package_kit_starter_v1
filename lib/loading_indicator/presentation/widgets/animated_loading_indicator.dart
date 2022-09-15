import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:package_kit_starter_v1/0_config_app/src/config_app.dart';

class AnimatedLoadingIndicator extends StatefulWidget {
  final ConfigApp configApp;
  final double? height;

  const AnimatedLoadingIndicator({
    Key? key,
    required this.configApp,
    this.height,
  }) : super(key: key);

  @override
  State<AnimatedLoadingIndicator> createState() => _AnimatedLoadingIndicatorState();
}

class _AnimatedLoadingIndicatorState extends State<AnimatedLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: widget.configApp.loadingIndicatorDurationSecond ?? 2),
      vsync: this,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: widget.height ?? 40,
      ),
      child: LoadingIndicator(
        indicatorType: widget.configApp.loadingIndicatorType ?? Indicator.ballRotateChase,
        colors: widget.configApp.loadingIndicatorColors ??
            [
              const Color(0xff04BBFF),
              const Color(0xff003C57),
              const Color(0xff0594D0),
              const Color(0xff007198),
            ],
        strokeWidth: 1,
      ),
    );
  }
}
