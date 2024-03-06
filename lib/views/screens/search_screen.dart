import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinterest_clone/middleware/images_search_bloc/image_search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<ImageSearchBloc>(context).add(SearchImageEvent(value));
                },
                decoration: InputDecoration(
                  labelText: 'Search images',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(child: Center(child: Text('Images'),))
          ]
        ),
      ),
    );
  }
}
