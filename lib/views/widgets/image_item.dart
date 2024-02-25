import 'package:flutter/material.dart';
import 'package:pinterest_clone/models/image_model.dart';

class ImageItem extends StatelessWidget {
  final GeneratedImage image;

  const ImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            image.url,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.menu_rounded),
        )
      ],
    );
  }
}
