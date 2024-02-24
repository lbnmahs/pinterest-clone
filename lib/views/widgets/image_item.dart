import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String image;

  const ImageItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            image,
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
