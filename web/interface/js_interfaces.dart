import 'dart:js_interop';

extension type Point2D._(JSObject _) implements JSObject {
  external double x;
  external double y;
}

extension type Shape._(JSObject _) implements JSObject {}

extension type Shape2D._(JSObject _) implements Shape {
  external double? get sides;
  external double get perimeter;
  external double get area;
}

extension type MonObjet._(JSObject _) {
  external double x;

 external factory MonObjet(double x);
}