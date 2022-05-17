abstract class Action {}

class Toggle extends Action {
  final int x;
  final int y;

  Toggle(this.x, this.y);
}
