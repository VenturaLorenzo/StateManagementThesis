import 'package:activity_state_management/bloc/core/pixels_event.dart';
import 'package:activity_state_management/bloc/core/pixels_state.dart';
import 'package:bloc/bloc.dart';

import '../../config.dart';

class PixelsBloc extends Bloc<PixelsEvent, PixelsState> {
  PixelsBloc() : super(PixelsCurrentState(List.generate(pixelsSquared,
          (index) => List.generate(pixelsSquared, (index) => false))
      ));

  @override
  Stream<PixelsState> mapEventToState(PixelsEvent event) async* {
    if (event is LoadPixels) {
      print("ricevuto evento load");
      List<List<bool>> pixels = List.generate(pixelsSquared,
          (index) => List.generate(pixelsSquared, (index) => false));
      yield PixelsCurrentState(pixels);
    } else {
      if (event is TogglePixel &&
          (state as PixelsCurrentState).pixels.isNotEmpty) {
        print("ricevuto evento toggle");
        List<List<bool>> newPixels = (state as PixelsCurrentState)
            .pixels
            .map((List<bool> element) => List<bool>.from(element))
            .toList();
        newPixels[event.x][event.y] = true;
        yield PixelsCurrentState(newPixels);
      }
    }
  }
}
