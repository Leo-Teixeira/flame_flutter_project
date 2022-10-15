import 'package:flame/components.dart';
import 'package:flutter/material.dart';

// Permet de definir la couleur de fond du jeu selon la route ou nous sommes
class Background extends Component {
  Background(this.color);
  final Color color;

  // Permet de dessiner cette couleur sur tout le fond du plateau
  @override
  void render(Canvas canvas) {
    canvas.drawColor(color, BlendMode.srcATop);
  }
}
