import 'package:flutter/material.dart';
import 'package:pinterest_clone/models/image_model.dart';
import 'package:pinterest_clone/views/widgets/image_item.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key, required this.images});

  final List<GeneratedImage> images;

  @override
  State<ImagesScreen> createState() {
    return _ImagesScreenState();
  }
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.images.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 0.8
      ), 
      itemBuilder: (context, index) => ImageItem(
        image: widget.images[index],
      )
    );
  }
}