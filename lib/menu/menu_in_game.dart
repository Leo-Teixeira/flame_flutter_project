import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_project/common/background.dart';
import 'package:flame_project/upgrade/cursor_upgrade.dart';
import '../common/back_button.dart';
import '../common/router.dart' as Route;

class MenuPage extends Component with HasGameRef<Route.RouterGame> {
  late final CursorUpgrade _cursor;
  Future<void>? onLoad() {
    add(Background(Color(0xff2D86CE)));
    add(BackButton());
    _cursor = CursorUpgrade();
    add(_cursor);
  }
}
