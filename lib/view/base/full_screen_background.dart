import 'package:flutter/material.dart';
import 'package:picscope/theme_notifier.dart';
import 'package:picscope/view/base/components/app_bar.dart';
import 'package:provider/provider.dart';

class FullScreenBackgound extends StatelessWidget {
  final Widget child;
  const FullScreenBackgound({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: fullScreenAppBar(context, themeNotifier),
      body: Column(
        children: [
          Expanded(child: child),
        ],
      ),
    );
  }
}
