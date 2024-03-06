import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinterest_clone/middleware/images_search_bloc/image_search_bloc.dart';
import 'package:pinterest_clone/views/widgets/images_list.dart';

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
                  if(value.isNotEmpty){
                    BlocProvider.of<ImageSearchBloc>(context).add(
                      SearchImageEvent(value)
                    );
                  } else {
                    BlocProvider.of<ImageSearchBloc>(context).add(
                      ClearSearchEvent()
                    );
                  }
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Search images',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ImageSearchBloc, ImageSearchState>(
                builder: (context, state) {
                  if(state is ImageSearchInitial) {
                    return const Center(child: Text('Search for Images'));
                  }
                  if(state is ImageSearchFailure) {
                    return Center(child: Text(state.message));
                  }
                  if(state is ImageSearchSuccess) {
                    if(state.hasResults){
                      return ImageList(images: state.images);
                    } else {
                      return const Center(child: Text('No results found'));
                    }
                  }
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
              )
            )
          ]
        ),
      ),
    );
  }
}
