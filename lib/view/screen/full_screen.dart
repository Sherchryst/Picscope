import 'package:flutter/material.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/view/base/full_screen_background.dart';

class FullScreenPage extends StatelessWidget {
  final String imageUrl;

  const FullScreenPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FullScreenBackgound(
      child: SizedBox(
          width: responsive.screenWidth(context),
          child: InteractiveViewer(child: Image.network(imageUrl))),
    );
  }
}
