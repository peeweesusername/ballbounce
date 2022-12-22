import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:ballbounce/mycontactstuff.dart';

class BounceyBall extends BodyComponent {
  final Vector2 position;
  final Vector2 acceleration = Vector2.zero();

  BounceyBall({required this.position});

  @override
  Body createBody() {
    const double sensorScale = 0.003;
    final shape = CircleShape()..radius = 2;
    final mycontact = BallContactCallbacks(theBall: this);
    final fixtureDef = FixtureDef(shape, density: 1.0, restitution: 0.7, friction: 0.1);
    final bodyDef = BodyDef(position: position, type: BodyType.dynamic, userData: mycontact);

    //gyroscopeEvents.listen((GyroscopeEvent event) {
    //  acceleration.setValues(event.y / sensorScale, event.x / sensorScale);
    //acceleration.add(Vector2(event.y / sensorScale, event.x / sensorScale));
    //});
    accelerometerEvents.listen((AccelerometerEvent event) {
      acceleration.setValues(-1*event.x / sensorScale, event.y / sensorScale);
      //acceleration.add(Vector2(-1*event.x / sensorScale, event.y / sensorScale));
    });

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void update(double dt) {
    body.applyForce(acceleration);
  }

}
