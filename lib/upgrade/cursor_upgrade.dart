import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text.dart';
import 'package:flame_project/common/router.dart';
import 'package:flame_project/game/game_manager.dart';
import '../common/router.dart' as Route;

class CursorUpgrade extends Component
    with HasGameRef<Route.RouterGame>, TapCallbacks {
  Future<void>? onLoad() {
    var cursor = TextBoxComponent(
        text: "Cursor",
        position: Vector2.all(gameRef.size.toSize().width / 2),
        anchor: Anchor.center,
        // var originalSize = sprite?.originalSize;
        // if (originalSize == null) return;
        // var width = gameRef.size.toSize().width / 2;
        // var height =
        //     originalSize.toSize().height * (width / originalSize.toSize().width);
        size: Vector2(
            gameRef.size.toSize().width, gameRef.size.toSize().height / 5));
  }
}
