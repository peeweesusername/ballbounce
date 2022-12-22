import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:ballbounce/bounceyball.dart';
import 'package:ballbounce/containmentbox.dart';

class BallContactCallbacks extends ContactCallbacks {
  final BounceyBall theBall;

  BallContactCallbacks({required this.theBall});

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is ContainmentBox) {
      FlameAudio.play('boing.mp3');
      theBall.setColor(const Color(0xFFEE4B2B));
    } //else if (other is BounceyBall) {
    else {
      print('hit ball');
      FlameAudio.play('glassbreak.mp3');
      theBall.setColor(const Color(0xFFFFFF00));
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    theBall.setColor(const Color(0xFFFFFFFF));
  }
}