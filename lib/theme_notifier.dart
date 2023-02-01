import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/view/home/components/image_grid.dart';
import 'package:picscope/view/home/components/image_list.dart';

// Class that holds the current theme state and updates it when the user switches themes
class ThemeNotifier with ChangeNotifier {
  // Private variable to store the current theme state
  bool _isDarkTheme = false;
  bool _isListView = true;

  // Getter for the current theme state
  bool get isDarkTheme => _isDarkTheme;
  bool get isListView => _isListView;

  // Method to toggle the theme state and notify listeners
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  void toggleView() {
    _isListView = !_isListView;
    notifyListeners();
  }

  // Method to return the current theme data
  ThemeData getTheme() {
    return _isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }

  // Method to return the current display mode
  Widget getDisplayMode(
      {required List<Photo>? photos,
      required void Function(BuildContext, bool) loadNextPage,
      required bool isThereMorePages}) {
    return _isListView
        ? ImageList(
            photos: photos,
            loadNextPage: loadNextPage,
            isThereMorePages: isThereMorePages,
          )
        : ImageGrid(
            photos: photos,
            loadNextPage: loadNextPage,
            isThereMorePages: isThereMorePages,
          );
  }
}
