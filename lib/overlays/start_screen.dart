import 'package:flutter/material.dart';

import '../jump_monster.dart';

class StartScreen extends StatelessWidget {
  // Reference to parent game.
  final JumpMonsterGame game;

  const StartScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
        color: Colors.transparent,
        elevation: 100,
        child: Center(
          child: Transform.rotate(
            angle: 1.57,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 270,
              width: 270,
              decoration: const BoxDecoration(
                color: blackTextColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Cookie Monster Run',
                    style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        game.overlays.remove('StartScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteTextColor,
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: blackTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    '''Tap on the left to jump. 
Tap on the right to move faster.
Eat cookies to regain coins. 
Stay away from enemies!!! ''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
