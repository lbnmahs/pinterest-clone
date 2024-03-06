// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pinterest_clone/data/repository/image_repository.dart';
import 'package:pinterest_clone/models/image_model.dart';

part 'image_search_event.dart';
part 'image_search_state.dart';

class ImageSearchBloc extends Bloc<ImageSearchEvent, ImageSearchState> {
  final ImageSearchRepository imageSearchRepository;

  ImageSearchBloc(this.imageSearchRepository) : super(ImageSearchInitial()) {
    on<ImageSearchEvent>(_getSearchedImages);
  }

  void _getSearchedImages (ImageSearchEvent event, Emitter<ImageSearchState> emit) async {
    emit(ImageSearchLoading());
    try {
      if (event is SearchImageEvent) {
        final images = await imageSearchRepository.searchImages(event.query);
        emit(ImageSearchSuccess(images));
      }
    } catch (e) {
      emit(ImageSearchFailure(e.toString()));
    }
  }
}
