import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinterest_clone/middleware/images_bloc/images_bloc.dart';
import 'package:pinterest_clone/views/widgets/images_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar
      appBar: AppBar(
        title: Column(
          children: [
            const Text('All'),
            const SizedBox(height: 5),
            Container(
              height: 3,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(20),
              )
            )
          ],
        ),
        forceMaterialTransparency: true,
      ),

      // This is the entry point for the images.
      // We are using BLoC to fetch images from the Unsplash API.
      body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: ((context, state) {
          // If there is a problem with the API call, we show an error message.
          if (state is ImagesFailure) {
            return Center(child: Text(state.message));
          }
          // If the API call is successful, we show the list of images.
          if (state is ImagesSuccess) {
            final images = state.images;
            return RefreshIndicator(
              // This helps to refresh the images when the user pulls down the screen.
              onRefresh: () async {
                context.read<ImagesBloc>().add(ImagesFetched());
              },
              child: ImageList(images: images)
            );
          }
          // If the API call is still in progress, we show a loading indicator.
          return const Center(child: CircularProgressIndicator.adaptive());
        }),
      ),
    );
  }
}
