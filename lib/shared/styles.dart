import 'package:flutter/material.dart';
import 'package:picscope/shared/basic.dart';

Styles styles = Styles();

class Styles {
  //Text Buttons Styles
  ButtonStyle textButtonStyle(BuildContext context) => ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      textStyle: MaterialStateProperty.all<TextStyle>(textButton(context)));

  // Outlined Input Border Styles
  OutlineInputBorder inputBorderStyle(BuildContext context,
          {bool isFocused = false}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(basics.borderRadiusLarge),
        borderSide: BorderSide(
          color: isFocused
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor,
          width: 2,
        ),
      );

  // Text Field Decoration
  InputDecoration textFieldDecoraction(BuildContext context,
      {String hintText = "Rechercher"}) {
    ThemeData theme = Theme.of(context);
    return InputDecoration(
      hintText: hintText,
      hintStyle: styles.textBody(context),
      prefixIcon: Icon(
        Icons.search,
        color: theme.primaryColor,
      ),
      filled: true,
      fillColor: theme.canvasColor,
      enabledBorder: inputBorderStyle(context),
      focusedBorder: inputBorderStyle(context, isFocused: true),
    );
  }

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
