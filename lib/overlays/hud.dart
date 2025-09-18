import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../jump_monster.dart';
import 'coins.dart';

class Hud extends PositionComponent with HasGameReference<JumpMonsterGame> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
  });

  late TextComponent _scoreTextComponent;

  @override
  Future<void> onLoad() async {
    _scoreTextComponent = TextComponent(
        text: '${game.cookiesCollected}',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 32,
            color: Color.fromRGBO(10, 10, 10, 1),
          ),
        ),
        anchor: Anchor.center,
        position: Vector2(350, game.size.y - 140),
        angle: 1.57);
    add(_scoreTextComponent);

    final cookieSprite = await game.loadSprite('cookie_still.png');
    add(
      SpriteComponent(
          sprite: cookieSprite,
          position: Vector2(350, game.size.y - 100),
          size: Vector2.all(32),
          anchor: Anchor.center,
          angle: 1.57,
          priority: 100),
    );

    for (var i = 1; i <= game.health; i++) {
      final positiony = 40 * i + 30;
      await add(
        CoinHealthComponent(
            coinNumber: i,
            position: Vector2(350, positiony.toDouble()),
            size: Vector2.all(32),
            anchor: Anchor.center,
            angle: 1.57),
      );
    }
  }

  @override
  void update(double dt) {
    _scoreTextComponent.text = '${game.cookiesCollected}';
  }
}
