import 'package:flutter/material.dart';
import 'package:package_kit_starter_v1/dialog/presentation/widgets/dialogs.dart';

import 'image_gallery_thumbnail.dart';

class ImageGallery extends StatefulWidget {
  final List<String> listImages;
  final bool fromUrl;

  const ImageGallery({
    Key? key,
    required this.listImages,
    required this.fromUrl,
  }) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentImage = 0;
  int previousImage = 0;
  int nextImage = 1;
  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show current image selected or default = 0
        Container(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              widget.fromUrl == true
                  ? Dialogs(context: context).dialogViewImage(context, imageUrl: widget.listImages[currentImage])
                  : Dialogs(context: context).dialogViewImage(context, imageAsset: widget.listImages[currentImage]);
            },
            child: widget.fromUrl == true
                ? Image.network(
                    widget.listImages[currentImage],
                    fit: BoxFit.cover,
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                  )
                : Image.asset(
                    widget.listImages[currentImage],
                    fit: BoxFit.cover,
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                  ),
          ),
        ),

        // Show thumbnail of all images
        Container(
          alignment: Alignment.centerLeft,
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: widget.listImages.length,
            itemBuilder: (context, index) {
              String image = widget.listImages[index];

              return InkWell(
                onHover: (value) {},
                onTap: () {
                  setState(() {
                    currentImage = index;
                  });
                },
                child: ImageGalleryThumbnail(
                  image: image,
                  fromUrl: widget.fromUrl,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
