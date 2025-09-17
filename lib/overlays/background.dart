import 'package:flame/components.dart';

import '../jump_monster.dart';

class Background extends SpriteComponent
    with HasGameReference<JumpMonsterGame> {
  final Vector2 volume;
  Background({required this.volume})
      : super(size: volume, anchor: Anchor.bottomLeft, angle: 1.57);
  @override
  void onLoad() {
    final forestImage = game.images.fromCache('background.png');
    sprite = Sprite(forestImage);
    position = Vector2(0, 0);
  }
}
