import 'package:equatable/equatable.dart';

abstract class PixelsEvent extends Equatable {}

class LoadPixels extends PixelsEvent {
  @override
  List<Object?> get props => [];
}

class TogglePixel extends PixelsEvent {
  final int x;
  final int y;

  TogglePixel(this.x, this.y);

  @override
  List<Object?> get props => [x, y];
}

class ResetPixels extends PixelsEvent {
  @override
  List<Object?> get props => [];
}