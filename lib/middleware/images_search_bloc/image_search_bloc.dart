import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_search_event.dart';
part 'image_search_state.dart';

class ImageSearchBloc extends Bloc<ImageSearchEvent, ImageSearchState> {
  ImageSearchBloc() : super(ImageSearchInitial()) {
    on<ImageSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
