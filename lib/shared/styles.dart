import 'package:flutter/material.dart';

Styles styles = Styles();

class Styles {
  //Horizontal spacing
  Widget hSpaceTiny = const SizedBox(width: 5);
  Widget hSpaceSmall = const SizedBox(width: 10);
  Widget hSpaceMedium = const SizedBox(width: 20);
  Widget hSpaceLarge = const SizedBox(width: 40);
  Widget hSpaceMassive = const SizedBox(width: 80);
  Widget hSpaceHuge = const SizedBox(width: 120);
  Widget hSpaceGiant = const SizedBox(width: 200);

  //Vertical spacing
  Widget vSpaceTiny = const SizedBox(height: 5);
  Widget vSpaceSmall = const SizedBox(height: 10);
  Widget vSpaceMedium = const SizedBox(height: 20);
  Widget vSpaceLarge = const SizedBox(height: 40);
  Widget vSpaceMassive = const SizedBox(height: 80);
  Widget vSpaceHuge = const SizedBox(height: 120);
  Widget vSpaceGiant = const SizedBox(height: 200);

  //Border Radius Styles
  Radius borderRadiusTiny = const Radius.circular(5);
  Radius borderRadiusSmall = const Radius.circular(10);
  Radius borderRadiusMedium = const Radius.circular(20);
  Radius borderRadiusLarge = const Radius.circular(40);
  Radius borderRadiusMassive = const Radius.circular(80);

  //Text Buttons Styles
  ButtonStyle textButtonStyle = ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w300, fontFamily: 'Popins')));

  // Outlined Input Border Styles
  OutlineInputBorder inputBorderStyle(BuildContext context,
          {bool isFocused = false}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(borderRadiusMedium),
        borderSide: BorderSide(
          color: isFocused
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor,
          width: 2,
        ),
      );

  // Method to get the generic text style
  TextStyle _getTextStyle(BuildContext context,
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w300,
      String fontFamily = 'Popins'}) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.light
        ? TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, fontFamily: fontFamily)
        : TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            color: Colors.white);
  }

  // Method to get the specific text style
  TextStyle textTitle(BuildContext context) =>
      _getTextStyle(context, fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle textSubtitle(BuildContext context) =>
      _getTextStyle(context, fontSize: 18, fontWeight: FontWeight.w600);
  TextStyle textBody(BuildContext context) =>
      _getTextStyle(context, fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle textCaption(BuildContext context) =>
      _getTextStyle(context, fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle textButton(BuildContext context) =>
      _getTextStyle(context, fontSize: 16, fontWeight: FontWeight.w500);
}
