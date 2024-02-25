import 'package:flutter/material.dart';
import 'package:pinterest_clone/models/image_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageItem extends StatelessWidget {
  final GeneratedImage image;

  const ImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(image.url),
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Icon(
            Icons.menu_rounded,
            size: 12,
          ),
        )
      ],
    );
  }
}
