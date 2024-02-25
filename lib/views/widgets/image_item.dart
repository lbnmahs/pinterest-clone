import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:pinterest_clone/models/image_model.dart';

class ImageItem extends StatelessWidget {
  final GeneratedImage image;
  final double height;

  const ImageItem({super.key, required this.image, required this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(image.url),
            fit: BoxFit.cover,
            height: height,
            width: double.infinity,
          ),
          const Positioned(
            bottom: 5,
            right: 5,
            child: Icon(
              Icons.menu_rounded,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
