import 'package:agenda_cancha_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes(
      BuildContext context) {
    return {
      '/': (context) => const HomeScreen(),
    };
  }
}
