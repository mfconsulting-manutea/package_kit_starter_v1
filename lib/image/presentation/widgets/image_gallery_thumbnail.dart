import 'package:flutter/material.dart';

class ImageGalleryThumbnail extends StatefulWidget {
  final String image;
  final bool fromUrl;

  const ImageGalleryThumbnail({
    Key? key,
    required this.image,
    required this.fromUrl,
  }) : super(key: key);

  @override
  State<ImageGalleryThumbnail> createState() => _ImageGalleryThumbnailState();
}

class _ImageGalleryThumbnailState extends State<ImageGalleryThumbnail> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, right: 5),
      child: SizedBox(
        height: 100,
        width: 150,
        child: widget.fromUrl == true
            ? Image.network(
                widget.image,
                fit: BoxFit.cover,
              )
            : Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
