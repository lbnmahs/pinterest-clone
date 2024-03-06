import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pinterest_clone/models/image_model.dart';
import 'package:pinterest_clone/views/widgets/image_item.dart';

class ImageList extends StatefulWidget {
  const ImageList({super.key, required this.images});

  final List<GeneratedImage> images;

  @override
  State<ImageList> createState() {
    return _ImageListState();
  }
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) => ImageItem(
        image: widget.images[index],
        height: (index % 6 + 1) * 90,
      ),
      itemCount: widget.images.length,
    );
  }
}