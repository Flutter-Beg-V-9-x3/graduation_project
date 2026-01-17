import 'package:flutter/material.dart';

class NavigationManager {
  NavigationManager._(); // private constructor

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// -----------------------------
  /// Push to a new screen
  /// -----------------------------
  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// -----------------------------
  /// Replace current screen
  /// -----------------------------
  static Future<dynamic> pushReplacement(Widget page) {
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// -----------------------------
  /// Remove all previous screens
  /// -----------------------------
  static Future<dynamic> pushAndRemoveUntil(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// -----------------------------
  /// Go back
  /// -----------------------------
  static void pop() {
    navigatorKey.currentState!.pop();
  }
}
