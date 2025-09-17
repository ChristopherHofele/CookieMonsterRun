import 'package:cookie_monster/jump_monster.dart';
import 'package:flame/components.dart';

enum HeartState {
  available,
  unavailable,
}

class HeartHealthComponent extends SpriteGroupComponent<HeartState>
    with HasGameReference<JumpMonsterGame> {
  final int coinNumber;

  HeartHealthComponent({
    required this.coinNumber,
    required super.position,
    required super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.priority,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final availableSprite = await game.loadSprite(
      'coin.png',
      srcSize: Vector2.all(32),
    );

    final unavailableSprite = await game.loadSprite(
      'coin_spent.png',
      srcSize: Vector2.all(32),
    );

    sprites = {
      HeartState.available: availableSprite,
      HeartState.unavailable: unavailableSprite,
    };

    current = HeartState.available;
  }

  @override
  void update(double dt) {
    if (game.health < coinNumber) {
      current = HeartState.unavailable;
    } else {
      current = HeartState.available;
    }

    super.update(dt);
  }
}
