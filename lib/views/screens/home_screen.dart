import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinterest_clone/bloc/images_bloc.dart';
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
      body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: ((context, state) {
          if (state is ImagesFailure) {
            return Center(child: Text(state.message));
          }
          if (state is ImagesSuccess) {
            final images = state.images;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ImagesBloc>().add(ImagesFetched());
              },
              child: ImagesScreen(images: images)
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        }),
      ),
    );
  }
}
