import 'package:flutter/material.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/shared/basic.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/view/base/background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Column(
        children: [
          basics.vSpaceMedium,
          SizedBox(
            width: responsive.isDesktop(context)
                ? responsive.screenWidthPercentage(context, percentage: 0.6)
                : responsive.screenWidthPercentage(context, percentage: 0.9),
            child: TextField(
              style: styles.textBody(context),
              decoration: styles.textFieldDecoraction(context),
            ),
          ),
        ],
      ),
    );
  }
}
