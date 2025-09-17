import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../jump_monster.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameReference<JumpMonsterGame> {
  final Vector2 gridPosition;
  double yOffset;

  final Vector2 velocity = Vector2.zero();

  Enemy({
    required this.gridPosition,
    required this.yOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.topLeft, angle: 1.57);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('enemy.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(64),
        stepTime: 0.25,
      ),
    );
    position = Vector2(
      game.size.x / 10 + (gridPosition.y * size.y),
      (gridPosition.x * size.y) + yOffset,
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
    add(
      MoveEffect.by(
        Vector2(0, -2 * size.x),
        EffectController(
          duration: 3,
          alternate: true,
          infinite: true,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    velocity.y = game.objectSpeed;
    position += velocity * dt;
    if (position.y < -size.y || game.health <= 0) removeFromParent();
    super.update(dt);
  }
}
