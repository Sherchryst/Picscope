import 'package:flutter/material.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/shared/theme.dart';

SliverAppBar appBar(ThemeNotifier themeNotifier, BuildContext context) {
  return SliverAppBar(
    centerTitle: true,
    floating: true,
    expandedHeight: 60,
    elevation: 0,
    title: Text('Picscope', style: styles.textTitle(context)),
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
