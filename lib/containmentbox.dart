import 'package:flame/experimental.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class ContainmentBox extends BodyComponent {
  final Vector2 gameSize;

  ContainmentBox(this.gameSize);

  @override
  Body createBody() {
    //final shape = EdgeShape()
    //  ..set(Vector2(0, gameSize.y - 3), Vector2(gameSize.x, gameSize.y - 3));
    final indices = <Vector2>[Vector2(0, 4), Vector2(0, gameSize.y-4), Vector2(gameSize.x, gameSize.y-4), Vector2(gameSize.x, 4), Vector2(0, 4) ];
    final shape = ChainShape();
    shape.createChain(indices);
    final fixtureDef = FixtureDef(shape, density: 1.0, restitution: 0.9, friction: 0.5);
    final bodyDef = BodyDef(userData: this, position: Vector2.zero());
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}