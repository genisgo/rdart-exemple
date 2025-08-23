import 'dart:js_interop';
import '../interface/js_interfaces.dart';
@JS("createPoint2D")
external Point2D createPoint2D (double x, double y);

@JS("createRectangle")
external Shape2D createRectangle(double width,double heigth);