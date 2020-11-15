import 'package:flutter_web_ui/ui.dart' as ui;
// import 'package:websitegyd/excellencegyd.dart' as app;
import 'package:websitegyd/main.dart' as app;
import 'dart:html' as html;

main() async {
  await ui.webOnlyInitializePlatform();
  html.window.history.back();
  html.window.history.forward();
  app.main();
}
