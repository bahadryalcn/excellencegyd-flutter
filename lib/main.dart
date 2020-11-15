import 'package:flutter/material.dart';
import 'excelllencegyd.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'locator.dart';

void main() {
  configureApp();
  // setupLocator();
  runApp(ExcellenceGYD());
}
// flutter pub global run peanut:peanut
