import 'package:flame/components.dart';
import 'package:flame/events.dart';

class JumpButton extends PositionComponent with TapCallbacks {
  JumpButton({
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.bottomLeft);

  bool hasTapped = false;
  @override
  void onTapDown(TapDownEvent event) {
    hasTapped = true;
  }

  void onTapUp(TapUpEvent event) {
    hasTapped = false;
  }
}
