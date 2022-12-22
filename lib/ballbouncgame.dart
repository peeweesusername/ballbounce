import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:ballbounce/bounceyball.dart';
import 'package:ballbounce/containmentbox.dart';

class BallBounceGame extends Forge2DGame {
  BallBounceGame() : super(gravity: Vector2(0, 0));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    Vector2 gameSize = screenToWorld(camera.viewport.effectiveSize);
    add(ContainmentBox(gameSize));
    add(BounceyBall(position: Vector2(gameSize.x/2,gameSize.y/3)));
    add(BounceyBall(position: Vector2(gameSize.x/2,2*gameSize.y/3)));
  }
}