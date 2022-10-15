import 'package:flame/components.dart';
import 'package:flame_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flame/experimental.dart';
import '../common/background.dart';
import '../common/router.dart' as Route;

// Menu de notre jeu
class StartPage extends Component with HasGameRef<Route.RouterGame> {
  StartPage() {
    addAll([
      Background(const Color(0xff10A0EE)),
      // Permet de créer le logo de notre jeu, à savoir dans ce cas un simple texte avec different caracteristique
      _logo = TextComponent(
        text: 'Cookie Clicker',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 50,
            color: Color(0xFF370606),
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      ),
      // Permet de definir les differents level du jeu qui lors de leurs clique vont nous rediriger vers le jeu en lui meme selon le niveau
      _button1 = RoundedButton(
        text: 'Jouer',
        action: () => gameRef.router.pushNamed('game'),
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      ),
    ]);
  }

  late final TextComponent _logo;
  late final RoundedButton _button1;

  // Permet de definir la position des differents composants
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _logo.position = Vector2(size.x / 2, size.y / 2);
    _button1.position = Vector2(size.x / 2, _logo.y + 80);
  }
}
