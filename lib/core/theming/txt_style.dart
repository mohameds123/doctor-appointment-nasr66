import 'package:docdocnasr66/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle fontSize14W600White = TextStyle(
    color: ColorsManager.white,
    fontWeight: FontWeight.w600,
    fontSize: 14
  );
  static const TextStyle size14w400white = TextStyle(color: ColorsManager.white,
      fontSize: 14 , fontWeight: FontWeight.w400);
  static const TextStyle size24w400black = TextStyle(color: ColorsManager.black,
      fontSize: 24 , fontWeight: FontWeight.w400);
  static const TextStyle size16w300black = TextStyle(color: ColorsManager.black,
      fontSize: 16 , fontWeight: FontWeight.w300);
  static const TextStyle size12w400black = TextStyle(color: ColorsManager.black,
      fontSize: 12, fontWeight: FontWeight.w400);
  static const TextStyle size12w400blackhint = TextStyle(color: ColorsManager.gray,
      fontSize: 12, fontWeight: FontWeight.w400);
  static const TextStyle size24w400blackhintpass = TextStyle(color: ColorsManager.gray,
      fontSize: 24, fontWeight: FontWeight.w400);
  static final TextStyle size14w800primary = TextStyle(color: ColorsManager.primary,
      fontSize: 14, fontWeight: FontWeight.w800);
  static const TextStyle size14w300black = TextStyle(color: ColorsManager.black,
      fontSize: 14 , fontWeight: FontWeight.w300);
}