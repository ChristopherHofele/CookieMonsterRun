import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../jump_monster.dart';

class PlatformBlock extends SpriteComponent
    with HasGameReference<JumpMonsterGame> {
  final Vector2 gridPosition;
  final Vector2 velocity = Vector2.zero();
  double yOffset;

  PlatformBlock({
    required this.gridPosition,
    required this.yOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.topLeft, angle: 1.57);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('block.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      game.size.x / 10 + (gridPosition.y * size.y),
      (gridPosition.x * size.y) + yOffset,
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    velocity.y = game.objectSpeed;
    position += velocity * dt;
    if (position.y < -size.y || game.health <= 0) removeFromParent();
    super.update(dt);
  }
}
