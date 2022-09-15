import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/dialog/presentation/widgets/dialogs.dart';

class HeroImage extends StatelessWidget {
  final double? heightContainer;
  final String? imageUrl;
  final bool? disableBlackOverlay;

  const HeroImage({
    Key? key,
    this.heightContainer,
    this.imageUrl,
    this.disableBlackOverlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width;
    BoxFit imageFit = BoxFit.cover;

    if (imageUrl != null) {
      return Container(
        height: heightContainer ?? 320,
        color: disableBlackOverlay != true ? Colors.black : Colors.transparent,
        child: Opacity(
          opacity: disableBlackOverlay != true ? 0.7 : 1,
          child: GestureDetector(
            onTap: () => Dialogs(context: context).dialogViewImage(context, imageUrl: imageUrl!),
            child: Image.network(
              imageUrl!,
              width: imageWidth,
              fit: imageFit,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
