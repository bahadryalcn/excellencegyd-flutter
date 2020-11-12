import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const String route = '/contact';
  // static const String baseRoute = '/article';
  static String Function(String slug) routeFromSlug =
      (String slug) => route + '/$slug';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Geldi'),
    );
  }
}
