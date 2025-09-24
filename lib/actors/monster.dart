import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:cookie_monster/objects/cookie.dart';
import 'package:flame/effects.dart';

import '../jump_monster.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';
import 'enemy_horiz.dart';
import 'enemy_verti.dart';

class MonsterPlayer extends SpriteAnimationComponent
    with HasGameReference<JumpMonsterGame>, CollisionCallbacks {
  MonsterPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center, angle: 1.57);

  final double gravity = 15;
  final double jumpSpeed = 600;
  final double terminalVelocity = 1000;
  final double moveSpeed = 250;
  final Vector2 velocity = Vector2.zero();
  final Vector2 fromAbove = Vector2(1, 0);

  bool isOnGround = false;
  bool hasJumped = false;
  bool hitByEnemy = false;
  bool startedMoving = false;

  int isMoving = 0;

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('monster.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2(64, 60),
        stepTime: 0.12,
      ),
    );
    add(CircleHitbox());
  }

  @override
  Future<void> update(double dt) async {
    velocity.y = isMoving * moveSpeed;

    velocity.x -= gravity;

    if (isOnGround) {
      velocity.x = 0;
      if (hasJumped) {
        velocity.x = jumpSpeed;
        hasJumped = false;
        await game.soundEffect.play('jump');
      }
      isOnGround = false;
    }

    if (isMoving > 0) {
      startedMoving = true;
    }

    velocity.x = velocity.x.clamp(-jumpSpeed, terminalVelocity);
    if (startedMoving) {
      game.objectSpeed = game.difficulty;
    }

    if (position.x - 36 <= 0 && isMoving < 0) {
      velocity.x = 0;
    }

    if (position.y + 64 >= game.size.y / 2 && isMoving > 0) {
      velocity.y = 0;
      if (game.objectSpeed > -moveSpeed) {
        game.objectSpeed = -moveSpeed;
      } else {
        game.objectSpeed -= moveSpeed;
      }
    }
    position += velocity * dt;

    if (position.x < 0) {
      game.health = 0;
    }

    if (game.health <= 0) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is GroundBlock || other is PlatformBlock) {
      if (intersectionPoints.length >= 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.y / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if (fromAbove.dot(collisionNormal) > 0.9) {
          isOnGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }
    if (other is Cookie) {
      other.removeFromParent();
      game.cookiesCollected++;
    }

    if (other is EnemyHoriz || other is EnemyVerti) {
      hit();
    }

    super.onCollision(intersectionPoints, other);
  }

  void hit() async {
    if (!hitByEnemy) {
      game.health--;
      await game.soundEffect.play('hit');
      hitByEnemy = true;
    }
    add(
      OpacityEffect.fadeOut(
        EffectController(
          alternate: true,
          duration: 0.1,
          repeatCount: 10,
        ),
      )..onComplete = () {
          hitByEnemy = false;
        },
    );
  }
}
