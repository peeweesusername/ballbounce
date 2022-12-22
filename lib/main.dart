
import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ballbounce/ballbouncgame.dart';

void main() async {
  //Make sure flame is ready before we launch our game
  WidgetsFlutterBinding.ensureInitialized();
  await setupFlame();
  runApp(GameWidget(game: BallBounceGame()));
}

/// Setup all Flame specific parts
Future setupFlame() async {
  //await Flame.device.fullScreen();
  await Flame.device.setOrientation(DeviceOrientation.portraitUp);
}