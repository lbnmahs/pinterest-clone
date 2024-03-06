part of 'images_bloc.dart';

@immutable
sealed class ImagesState {}

final class ImagesInitial extends ImagesState {}

final class ImagesLoading extends ImagesState {}

final class ImagesSuccess extends ImagesState {
  final List<GeneratedImage> images;

  ImagesSuccess(this.images);
}

final class ImagesFailure extends ImagesState {
  final String message;

  ImagesFailure(this.message);
}
