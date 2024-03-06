part of 'image_search_bloc.dart';

@immutable
sealed class ImageSearchState {}

final class ImageSearchInitial extends ImageSearchState {}

final class ImageSearchLoading extends ImageSearchState {}

final class ImageSearchSuccess extends ImageSearchState {
  final List<GeneratedImage> images;
  final bool hasResults;

  ImageSearchSuccess(this.images) : hasResults = images.isNotEmpty;
}

final class ImageSearchFailure extends ImageSearchState {
  final String message;

  ImageSearchFailure(this.message);
}
