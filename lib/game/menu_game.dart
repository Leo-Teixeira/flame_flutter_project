import 'package:flame/components.dart';
import 'package:flame_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flame/experimental.dart';
import '../common/background.dart';
import '../common/router.dart' as Route;

class RoundedButton extends PositionComponent with TapCallbacks {
  RoundedButton({
    required this.text,
    required this.action,
    required Color color,
    required Color borderColor,
    super.anchor = Anchor.center,
  }) : _textDrawable = TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w800,
          ),
        ).toTextPainter(text) {
    size = Vector2(150, 40);
    _textOffset = Offset(
      (size.x - _textDrawable.width) / 2,
      (size.y - _textDrawable.height) / 2,
    );
    _rrect = RRect.fromLTRBR(0, 0, size.x, size.y, Radius.circular(size.y / 2));
    _bgPaint = Paint()..color = color;
    _borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;
  }

  final String text;
  final void Function() action;
  final TextPainter _textDrawable;
  late final Offset _textOffset;
  late final RRect _rrect;
  late final Paint _borderPaint;
  late final Paint _bgPaint;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(_rrect, _bgPaint);
    canvas.drawRRect(_rrect, _borderPaint);
    _textDrawable.paint(canvas, _textOffset);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.05);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }
}

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
