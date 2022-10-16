import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/sprite.dart';
import 'package:flame_project/common/router.dart';
import 'package:flame_project/game/game_manager.dart';
import 'router.dart' as Route;

class BackButton extends SpriteComponent
    with HasGameRef<Route.RouterGame>, TapCallbacks {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("arrowBack.png");
    position = Vector2(
        gameRef.size.toSize().width / 10, gameRef.size.toSize().height / 50);
    anchor = Anchor.topRight;
    var originalSize = sprite?.originalSize;
    if (originalSize == null) return;
    var width = gameRef.size.toSize().width / 15;
    var height =
        originalSize.toSize().height * (width / originalSize.toSize().width);
    size = Vector2(width, height);
  }

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.router.pop();
  }
}
