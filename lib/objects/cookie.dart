import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../jump_monster.dart';

class Cookie extends SpriteAnimationComponent
    with HasGameReference<JumpMonsterGame> {
  final Vector2 gridPosition;
  double yOffset;

  final Vector2 velocity = Vector2.zero();

  Cookie({
    required this.gridPosition,
    required this.yOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.topLeft, angle: 1.57);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('cookie.png'),
        SpriteAnimationData.sequenced(
          amount: 8,
          textureSize: Vector2.all(32),
          stepTime: 0.16,
        ));
    add(RectangleHitbox(collisionType: CollisionType.passive));
    add(
      SizeEffect.by(
        Vector2(-24, -24),
        EffectController(
          duration: 1.5,
          reverseDuration: .5,
          infinite: true,
          curve: Curves.easeOut,
        ),
      ),
    );
    position = Vector2(
      game.size.x / 10 + (gridPosition.y * size.y),
      (gridPosition.x * size.y) + yOffset,
    );
  }

  @override
  void update(double dt) {
    velocity.y = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x || game.health <= 0) removeFromParent();
    super.update(dt);
  }
}
