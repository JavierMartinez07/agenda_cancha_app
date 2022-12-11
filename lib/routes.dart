import 'package:agenda_cancha_app/screens/court_selection/court_selection_page.dart';
import 'package:agenda_cancha_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes = {
    '': (context) => const HomePage(),
    '/courtselection': (context) => CourtSelectionPage(),
  };
}
