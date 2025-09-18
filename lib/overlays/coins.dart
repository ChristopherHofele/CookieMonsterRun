import 'package:cookie_monster/jump_monster.dart';
import 'package:flame/components.dart';

enum CoinState {
  available,
  unavailable,
}

class CoinHealthComponent extends SpriteGroupComponent<CoinState>
    with HasGameReference<JumpMonsterGame> {
  final int coinNumber;

  CoinHealthComponent({
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
      CoinState.available: availableSprite,
      CoinState.unavailable: unavailableSprite,
    };

    current = CoinState.available;
  }

  @override
  void update(double dt) {
    if (game.health < coinNumber) {
      current = CoinState.unavailable;
    } else {
      current = CoinState.available;
    }

    super.update(dt);
  }
}
