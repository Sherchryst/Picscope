import 'package:flutter/material.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/theme_notifier.dart';

AppBar appBar(ThemeNotifier themeNotifier, BuildContext context) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text('Picscope', style: styles.textTitle(context)),
    leading: toggleViewButton(themeNotifier),
    actions: [
      toggleThemeButton(themeNotifier),
    ],
  );
}

IconButton toggleViewButton(ThemeNotifier themeNotifier) {
  return IconButton(
    icon: Icon(themeNotifier.isListView ? Icons.grid_view : Icons.list),
    onPressed: () => themeNotifier.toggleView(),
  );
}

AppBar fullScreenAppBar(BuildContext context, ThemeNotifier themeNotifier) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.close),
      onPressed: () => Navigator.pop(context),
    ),
    actions: [toggleThemeButton(themeNotifier)],
  );
}

IconButton toggleThemeButton(ThemeNotifier themeNotifier) {
  return IconButton(
    icon: Icon(
      themeNotifier.isDarkTheme ? Icons.wb_sunny : Icons.brightness_3,
    ),
    onPressed: () {
      themeNotifier.toggleTheme();
    },
  );
}
