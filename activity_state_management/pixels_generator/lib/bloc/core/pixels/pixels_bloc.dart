import 'package:bloc/bloc.dart';

import '../../../../config.dart';
import 'pixels_event.dart';
import 'pixels_state.dart';

class PixelsBloc extends Bloc<PixelsEvent, PixelsState> {
  PixelsBloc()
      : super(PixelsCurrentState(List.generate(pixelsSquared,
            (index) => List.generate(pixelsSquared, (index) => false))));

  @override
  Stream<PixelsState> mapEventToState(PixelsEvent event) async* {
    if (event is LoadPixels) {
      yield PixelsCurrentState(generatePixels());
    } else if (event is TogglePixel &&
        (state as PixelsCurrentState).pixels.isNotEmpty) {
      List<List<bool>> newPixels = (state as PixelsCurrentState)
          .pixels
          .map((List<bool> element) => List<bool>.from(element))
          .toList();
      newPixels[event.x][event.y] = true;
      yield PixelsCurrentState(newPixels);
    }else if(event is ResetPixels){
      yield PixelsCurrentState(generatePixels());
    }
  }
}
