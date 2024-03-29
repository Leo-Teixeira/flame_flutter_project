import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/sprite.dart';
import 'package:flame_project/common/router.dart';
import 'package:flame_project/game/game_manager.dart';
import '../common/router.dart' as Route;

class MainCookie extends SpriteComponent
    with HasGameRef<Route.RouterGame>, TapCallbacks {
  final Function() onTap;

  MainCookie(this.onTap);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("cookie.png");
    position = gameRef.size / 2;
    anchor = Anchor.center;
    var originalSize = sprite?.originalSize;
    if (originalSize == null) return;
    var width = gameRef.size.toSize().width / 2;
    var height =
        originalSize.toSize().height * (width / originalSize.toSize().width);
    size = Vector2(width, height);
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTap.call();
  }
}
