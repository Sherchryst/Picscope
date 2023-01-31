import 'package:flutter/material.dart';
import 'package:picscope/shared/theme.dart';
import 'package:picscope/view/base/components/app_bar.dart';
import 'package:provider/provider.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: appBar(themeNotifier, context),
      body: SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}
