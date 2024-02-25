import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesInitial()) {
    on<ImagesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
