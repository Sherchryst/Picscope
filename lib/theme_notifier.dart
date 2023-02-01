import 'package:flutter/material.dart';

// Class that holds the current theme state and updates it when the user switches themes
class ThemeNotifier with ChangeNotifier {
  // Private variable to store the current theme state
  bool _isDarkTheme = false;

  // Getter for the current theme state
  bool get isDarkTheme => _isDarkTheme;

  // Method to toggle the theme state and notify listeners
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  // Method to return the current theme data
  ThemeData getTheme() {
    return _isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }
}
