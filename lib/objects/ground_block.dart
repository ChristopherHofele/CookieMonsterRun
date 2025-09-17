import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../managers/segment_manager.dart';
import '../jump_monster.dart';

class GroundBlock extends SpriteComponent
    with HasGameReference<JumpMonsterGame> {
  final Vector2 gridPosition;
  double yOffset;
  final UniqueKey _blockKey = UniqueKey();

  final Vector2 velocity = Vector2.zero();

  GroundBlock({
    required this.gridPosition,
    required this.yOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.topLeft, angle: 1.57);

  @override
  void onLoad() {
    final groundImage = game.images.fromCache('ground.png');
    sprite = Sprite(groundImage);
    position = Vector2(
      game.size.x / 10 + (gridPosition.y * size.y),
      (gridPosition.x * size.y) + yOffset,
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));

    if (gridPosition.x == 9 && position.y > game.lastBlockYPosition) {
      game.lastBlockKey = _blockKey;
      game.lastBlockYPosition = position.y + size.y;
    }
  }

  @override
  void update(double dt) {
    velocity.y = game.objectSpeed;
    position += velocity * dt;

    if (position.y < -size.y) {
      removeFromParent();
      if (gridPosition.x == 0) {
        game.loadGameSegments(
          Random().nextInt(segments.length),
          game.lastBlockYPosition,
        );
      }
    }

    if (gridPosition.x == 9) {
      if (game.lastBlockKey == _blockKey) {
        game.lastBlockYPosition = position.y + size.y - 10;
      }
    }
    if (game.health <= 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}
