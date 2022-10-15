import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_project/game/scoreComponent.dart';
import 'package:flame_project/sprite_component/cookie.dart';
import 'package:flame_project/sprite_component/cookieBack.dart';
import 'package:flutter/material.dart';
import '../common/background.dart';
import '../common/router.dart' as Route;

class GameManager extends Component with HasGameRef<Route.RouterGame> {
  static const int cookieSpawnByScore = 10;
  late Timer cookieSpawn;
  int score = 0;
  late TextComponent _score;

  Future<void>? onLoad() {
    add(Background(Color(0xff2D86CE)));
    _score = TextComponent(
        text: "Score: 0",
        position: Vector2(gameRef.size.toRect().width / 2, 10),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 32.0, color: Colors.white)));
    add(_score);
    add(MainCookie());
    cookieSpawn = Timer(1, onTick: _spawnCookie, repeat: true);
    // add(Score());
  }

  void _spawnCookie() {
    for (int i = 0; i <= min(score ~/ cookieSpawnByScore, 10); i++) {
      add(BackCookie());
    }
  }

  @override
  void onMount() {
    super.onMount();
    cookieSpawn.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    cookieSpawn.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    cookieSpawn.stop();
  }

  @override
  void clickCookie() {
    score++;
    _score.text = "Score: $score";
  }
}
