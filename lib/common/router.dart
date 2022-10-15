// Permet de definir toutes les routes de notre jeu afin de les utiliser partout ou l'on souhaite
import 'package:flame/experimental.dart';
import 'package:flame/game.dart' as R;

import '../game/game_manager.dart';
import '../game/menu_game.dart';

class RouterGame extends R.FlameGame with HasTappableComponents {
  late final R.RouterComponent router;

  @override
  Future<void> onLoad() async {
    add(
      // definission des differentes routes de notre jeu
      router = R.RouterComponent(
        routes: {
          //'menu': R.Route(MenuPage.new),
          'home': R.Route(StartPage.new),
          'game': R.Route(GameManager.new)
          // 'pause': PauseRoute(),
        },
        // route initial du jeu
        initialRoute: 'home',
      ),
    );
  }
}