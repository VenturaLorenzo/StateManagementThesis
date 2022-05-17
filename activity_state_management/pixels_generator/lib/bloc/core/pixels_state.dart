import 'package:equatable/equatable.dart';

abstract class PixelsState extends Equatable {}

class PixelsCurrentState extends PixelsState {
  final List<List<bool>> pixels;

  PixelsCurrentState(this.pixels);

  @override
  List<List<List<bool>>> get props => [pixels];
}
