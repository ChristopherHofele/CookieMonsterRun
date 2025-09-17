import 'package:flame/components.dart';
import 'package:flame/events.dart';

class MoveButton extends PositionComponent with TapCallbacks {
  MoveButton({
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.bottomLeft);

  @override
  bool get debugMode => true;

  int moveDirection = 0;
  @override
  void onTapDown(TapDownEvent event) {
    moveDirection = 1;
  }

  void onTapUp(TapUpEvent event) {
    moveDirection = 0;
  }
}
