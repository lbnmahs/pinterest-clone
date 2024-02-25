import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinterest_clone/bloc/images_bloc.dart';
import 'package:pinterest_clone/views/screens/images_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
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
          if( state is ImagesFailure) {
            return Center(child: Text(state.message));
          }
          if(state is ImagesSuccess) {
            final images = state.images;
            return ImagesScreen(images: images);
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),

        ],
      )
    );
  }
}
