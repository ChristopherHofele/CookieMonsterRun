import 'package:flame/components.dart';

import 'package:cookie_monster/actors/enemy_verti.dart';
import '../actors/enemy_horiz.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';
import '../objects/cookie.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
  segment2,
  segment3,
  segment4,
  segment5,
  segment6,
  segment7,
  segment8,
  segment9,
];

final segment0 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 1), EnemyHoriz),
  Block(Vector2(5, 3), PlatformBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 3), PlatformBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 3), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 3), PlatformBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment1 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 1), PlatformBlock),
  Block(Vector2(1, 2), PlatformBlock),
  Block(Vector2(1, 3), PlatformBlock),
  Block(Vector2(3, 6), PlatformBlock),
  Block(Vector2(6, 5), PlatformBlock),
  Block(Vector2(7, 5), PlatformBlock),
  Block(Vector2(7, 7), Cookie),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 1), PlatformBlock),
  Block(Vector2(8, 5), PlatformBlock),
  Block(Vector2(8, 6), EnemyHoriz),
  Block(Vector2(9, 0), GroundBlock),
];

final segment2 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(3, 3), PlatformBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(4, 3), PlatformBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 3), PlatformBlock),
  Block(Vector2(5, 4), EnemyHoriz),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 3), PlatformBlock),
  Block(Vector2(6, 4), PlatformBlock),
  Block(Vector2(6, 5), PlatformBlock),
  Block(Vector2(6, 7), Cookie),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment3 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 1), EnemyHoriz),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(2, 1), PlatformBlock),
  Block(Vector2(2, 2), PlatformBlock),
  Block(Vector2(4, 4), PlatformBlock),
  Block(Vector2(6, 6), PlatformBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 1), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 8), Cookie),
  Block(Vector2(9, 0), GroundBlock),
];

final segment4 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 2), EnemyVerti),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(2, 3), PlatformBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(3, 5), PlatformBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(4, 1), EnemyHoriz),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 5), PlatformBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 5), PlatformBlock),
  Block(Vector2(6, 7), Cookie),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 7), EnemyVerti),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 3), PlatformBlock),
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 1), EnemyHoriz),
  Block(Vector2(9, 3), PlatformBlock),
];

final segment5 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(3, 3), PlatformBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 2), EnemyVerti),
  Block(Vector2(5, 5), Cookie),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 1), EnemyHoriz),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 1), PlatformBlock),
  Block(Vector2(8, 2), PlatformBlock),
  Block(Vector2(8, 3), PlatformBlock),
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 6), Cookie),
];

final segment6 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(3, 3), PlatformBlock),
  Block(Vector2(3, 6), Cookie),
  Block(Vector2(5, 5), PlatformBlock),
  Block(Vector2(6, 5), PlatformBlock),
  Block(Vector2(6, 6), PlatformBlock),
  Block(Vector2(6, 9), Cookie),
  Block(Vector2(7, 6), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 6), PlatformBlock),
  Block(Vector2(8, 7), EnemyHoriz),
  Block(Vector2(9, 0), GroundBlock),
];

final segment7 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 1), EnemyVerti),
  Block(Vector2(2, 2), PlatformBlock),
  Block(Vector2(3, 5), Cookie),
  Block(Vector2(5, 2), PlatformBlock),
  Block(Vector2(7, 4), PlatformBlock),
  Block(Vector2(8, 4), PlatformBlock),
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 4), PlatformBlock),
  Block(Vector2(9, 5), EnemyHoriz),
];

final segment8 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 3), PlatformBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(2, 6), PlatformBlock),
  Block(Vector2(2, 7), Cookie),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(3, 6), EnemyVerti),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(4, 1), EnemyHoriz),
  Block(Vector2(4, 6), PlatformBlock),
  Block(Vector2(5, 0), GroundBlock),
  //Block(Vector2(5, 6), EnemyVerti), //too hard
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 6), PlatformBlock),
  Block(Vector2(6, 7), Cookie),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 6), EnemyVerti),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 3), PlatformBlock),
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 1), EnemyHoriz),
];

final segment9 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 2), PlatformBlock),
  Block(Vector2(3, 5), PlatformBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(4, 8), Cookie),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 1), PlatformBlock),
  Block(Vector2(5, 2), PlatformBlock),
  Block(Vector2(5, 3), PlatformBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 6), EnemyHoriz),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 1), EnemyHoriz),
  Block(Vector2(9, 0), GroundBlock),
];
