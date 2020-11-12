import 'package:flutter/material.dart';
import 'excelllencegyd.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(ExcellenceGYD());
}
// flutter pub global run peanut:peanut
