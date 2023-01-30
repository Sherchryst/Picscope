import 'package:flutter/material.dart';

BasicComponents basics = BasicComponents();

class BasicComponents {
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
}
