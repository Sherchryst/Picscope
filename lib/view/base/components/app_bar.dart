import 'package:flutter/material.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/theme_notifier.dart';

AppBar appBar(ThemeNotifier themeNotifier, BuildContext context) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text('Picscope', style: styles.textTitle(context)),
    leading: IconButton(
      icon: Icon(themeNotifier.isListView ? Icons.grid_view : Icons.list),
      onPressed: () => themeNotifier.toggleView(),
    ),
    actions: [
      IconButton(
        icon: Icon(
          themeNotifier.isDarkTheme ? Icons.wb_sunny : Icons.brightness_3,
        ),
        onPressed: () {
          themeNotifier.toggleTheme();
        },
      ),
    ],
  );
}
