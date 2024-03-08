// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    if (event is SearchImageEvent) {
      emit(ImageSearchLoading());
      try {
        final images = await imageSearchRepository.searchImages(event.query);
        emit(ImageSearchSuccess(images));
      } catch (e) {
        emit(ImageSearchFailure(e.toString()));
      }
    } else if (event is ClearSearchEvent) {
      emit(ImageSearchInitial());
    }
  }
}
