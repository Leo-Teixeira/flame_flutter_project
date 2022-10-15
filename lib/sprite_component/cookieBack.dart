import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import '../common/router.dart' as Route;

class BackCookie extends SpriteAnimationComponent
    with HasGameRef<Route.RouterGame> {
  final double _speed = 250;
  @override
  Future<void>? onLoad() async {
    var cookie = SpriteSheet(
        image: await Images().load("cookie.png"),
        srcSize: Vector2(130.0, 130.0));
    animation = cookie.createAnimation(row: 0, stepTime: 0.2);
    var size = 40.0;
    position = Vector2(
        Random()
            .nextInt((gameRef.size.toRect().width - size).toInt())
            .toDouble(),
        size);
    width = size;
    height = size;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 1) * _speed * dt;
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}
