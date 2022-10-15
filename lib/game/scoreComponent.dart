import 'dart:ui';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../common/router.dart' as Route;

class Score extends Component with HasGameRef<Route.RouterGame> {
  @override
  Future<void>? onLoad() {
    var score = TextComponent(
        text: "Score: 0",
        position: Vector2(gameRef.size.toRect().width / 2, 10),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 16.0, color: Colors.white)));
  }
}
