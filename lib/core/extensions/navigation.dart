import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Navigate to a new screen.
  Future<T?> go<T>({required Widget page}) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Replace the current screen by pushing a new screen and removing the previous screen.
  Future<T?> goAndFinish<T>({required Widget page}) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Push a new screen and remove all the previous screen until the specified screen.
  Future<T?> goAndRemoveAll<T>({required Widget page}) {
    return Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  /// Pop the current screen off.
  bool pop() {
    Navigator.pop(this);
    return true;
  }
}
