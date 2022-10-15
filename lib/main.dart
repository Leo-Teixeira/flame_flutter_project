import 'dart:math' as math;

import 'package:flame/components.dart';
// import 'package:flame/input.dart';
// import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart' as R;
import 'package:flame/rendering.dart';

import 'common/background.dart';
import 'common/router.dart';

// Permet de lancer le jeu
void main() {
  runApp(
    R.GameWidget(
      game: RouterGame(),
    ),
  );
}

