import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinterest_clone/bloc/images_bloc.dart';
import 'package:pinterest_clone/views/screens/images_screen.dart';
import 'package:pinterest_clone/views/widgets/bottom_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;
  
  void _onNavItemSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: 50,
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add, 
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        icons: const [
          Icons.home_rounded,
          Icons.search_rounded,
          Icons.messenger,
          Icons.person_rounded,
        ], 
        selectedIndex: _selectedIndex, 
        onItemSelected: _onNavItemSelect
      )
    );
  }
}
