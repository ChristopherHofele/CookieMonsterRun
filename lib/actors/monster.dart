import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:cookie_monster/objects/cookie.dart';
import 'package:flame/effects.dart';

import '../jump_monster.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';
import '../actors/enemy.dart';

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
  void update(double dt) {
    velocity.y = isMoving * moveSpeed;
    // Apply basic gravity
    velocity.x -= gravity;

    // Determine if ember has jumped
    if (isOnGround) {
      velocity.x = 0;
      if (hasJumped) {
        velocity.x = jumpSpeed;
        hasJumped = false;
      }
      isOnGround = false;
    }
    /*
    if (hasJumped) {
      if (isOnGround) {
        velocity.x = jumpSpeed;
        isOnGround = false;
      }
      hasJumped = false;
    }*/
    if (isMoving > 0) {
      startedMoving = true;
    }
// Prevent ember from jumping to crazy fast as well as descending too fast and
// crashing through the ground or a platform.
    velocity.x = velocity.x.clamp(-jumpSpeed, terminalVelocity);
    if (startedMoving) {
      game.objectSpeed = -50;
    }
// Prevent ember from going backwards at screen edge.
    if (position.x - 36 <= 0 && isMoving < 0) {
      velocity.x = 0;
    }
// Prevent ember from going beyond half screen.
    if (position.y + 64 >= game.size.y / 2 && isMoving > 0) {
      velocity.y = 0;
      game.objectSpeed = -moveSpeed;
    }

    position += velocity * dt;
    // If ember fell in pit, then game over.
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
        // Calculate the collision normal and separation distance.
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.y / 2) - collisionNormal.length;
        collisionNormal.normalize();

        // If collision normal is almost upwards,
        // ember must be on ground.
        if (fromAbove.dot(collisionNormal) > 0.9) {
          isOnGround = true;
        }

        // Resolve collision by moving ember along
        // collision normal by separation distance.
        position += collisionNormal.scaled(separationDistance);
      }
    }
    if (other is Cookie) {
      other.removeFromParent();
      game.cookiesCollected++;
    }

    if (other is Enemy) {
      hit();
    }

    super.onCollision(intersectionPoints, other);
  }

  // This method runs an opacity effect on ember
// to make it blink.
  void hit() {
    if (!hitByEnemy) {
      game.health--;
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
