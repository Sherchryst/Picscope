import 'package:flutter/material.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/shared/styles.dart';

SizedBox searchBar(BuildContext context, TextEditingController searchController,
    Function searchPhotos) {
  return SizedBox(
    width: responsive.isDesktop(context)
        ? responsive.screenWidthPercentage(context, percentage: 0.6)
        : responsive.screenWidthPercentage(context, percentage: 0.9),
    child: TextField(
      controller: searchController,
      style: styles.textBody(context),
      decoration: styles.textFieldDecoraction(context,
          onPressed: () => searchPhotos(context, false)),
      onSubmitted: (value) => searchPhotos(context, false),
    ),
  );
}
