import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:cookie_monster/actors/monster.dart';
import 'package:cookie_monster/overlays/background.dart';
import 'actors/enemy.dart';
import 'managers/segment_manager.dart';
import 'objects/ground_block.dart';
import 'objects/platform_block.dart';
import 'objects/cookie.dart';
import 'controls/jump_button.dart';
import 'controls/move_button.dart';
import 'overlays/hud.dart';

class JumpMonsterGame extends FlameGame with HasCollisionDetection {
  JumpMonsterGame();

  late double lastBlockYPosition = 0.0;
  late UniqueKey lastBlockKey;

  late MonsterPlayer _monster;
  late JumpButton jumpButton;
  late MoveButton moveButton;
  late Background background;
  double objectSpeed = 0.0;
  int cookiesCollected = 0;
  int health = 3;

  /*@override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }*/

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'coin.png',
      'enemy.png',
      'monster.png',
      'cookie.png',
      'cookie_still.png',
      'background.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    camera.viewfinder.zoom = 0.6;
    initializeGame(true);
  }

  @override
  void update(double dt) {
    if (health <= 0) {
      overlays.add('GameOver');
    }
    _monster.hasJumped = jumpButton.hasTapped;
    _monster.isMoving = moveButton.moveDirection;
    super.update(dt);
  }

  void loadGameSegments(int segmentIndex, double yPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
          world.add(GroundBlock(
              gridPosition: block.gridPosition, yOffset: yPositionOffset));
        case PlatformBlock:
          world.add(PlatformBlock(
              gridPosition: block.gridPosition, yOffset: yPositionOffset));
        case Cookie:
          world.add(Cookie(
              gridPosition: block.gridPosition, yOffset: yPositionOffset));
        case Enemy:
          world.add(Enemy(
              gridPosition: block.gridPosition, yOffset: yPositionOffset));
      }
    }
  }

  void initializeGame(bool loadHud) {
    // Assume that size.x < 3200
    final segmentsToLoad = (size.y / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _monster =
        MonsterPlayer(position: Vector2(canvasSize.x, canvasSize.y / 10));
    jumpButton = JumpButton(
        position: Vector2(0, canvasSize.y), size: Vector2(1000, 1000));
    moveButton =
        MoveButton(position: Vector2(0, 3000), size: Vector2(10000, 10000));
    background = Background(volume: Vector2(size.y, size.x));

    world.add(_monster);
    world.add(moveButton);
    world.add(jumpButton);

    if (loadHud) {
      camera.backdrop.add(background);
      camera.backdrop.add(Hud());
    }

    //camera.viewport.add(Hud());
  }

  void reset() {
    cookiesCollected = 0;
    health = 3;
    _monster.startedMoving = false;
    objectSpeed = 0;
    lastBlockYPosition = 0;
    initializeGame(false);
  }
}
