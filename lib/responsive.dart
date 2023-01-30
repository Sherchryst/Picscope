import 'package:flutter/material.dart';

Responsive responsive = Responsive();

// This class is used to create a responsive layout for the app
class Responsive {
  // Constants
  final double phoneMaxWidth = 576;
  final double tabletMaxWidth = 992;

  //Screen size and Screen size percentage
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double screenWidthPercentage(BuildContext context,
          {required double percentage}) =>
      screenWidth(context) * percentage;
  double screenHeightPercentage(BuildContext context,
          {required double percentage}) =>
      screenHeight(context) * percentage;

  // Method to check if the device is a mobile device
  bool isMobile(BuildContext context) => screenWidth(context) < phoneMaxWidth;

  // Method to check if the device is a tablet device
  bool isTablet(BuildContext context) =>
      screenWidth(context) >= phoneMaxWidth &&
      screenWidth(context) <= tabletMaxWidth;

  // Method to check if the device is a desktop device
  bool isDesktop(BuildContext context) => screenWidth(context) > tabletMaxWidth;
}
