part of 'image_search_bloc.dart';

@immutable
sealed class ImageSearchEvent {}

class SearchImageEvent extends ImageSearchEvent {
  final String query;

  SearchImageEvent(this.query);
}
