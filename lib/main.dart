import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'overlays/start_screen.dart';
import 'overlays/game_over.dart';
import 'jump_monster.dart';

void main() {
  runApp(
    GameWidget<JumpMonsterGame>.controlled(
      gameFactory: JumpMonsterGame.new,
      overlayBuilderMap: {
        'StartScreen': (_, game) => StartScreen(game: game),
        'GameOver': (_, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['StartScreen'],
    ),
  );
}
