// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:pinterest_clone/data/repository/image_repository.dart';
import 'package:pinterest_clone/models/image_model.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImageRepository imageRepository;

  ImagesBloc(this.imageRepository) : super(ImagesInitial()) {
    on<ImagesFetched>(_getImages);
  }

  void _getImages(ImagesFetched event, Emitter<ImagesState> emit) async {
    emit(ImagesLoading());
    try {
      final images = await imageRepository.getGeneratedImages();
      emit(ImagesSuccess(images));
    } catch (e) {
      emit(ImagesFailure(e.toString()));
    }
  }
}
