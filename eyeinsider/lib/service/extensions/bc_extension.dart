import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  IconButtonThemeData get iconTheme => Theme.of(this).iconButtonTheme;

  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
}

extension NavigatorExtension on BuildContext {
  // Push a new route onto the navigator stack
  Future<T?> push<T>(Widget page) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Push a new route and replace the current one
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
