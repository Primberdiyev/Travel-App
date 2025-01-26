import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';

class AppStyles {
  static TextStyle get body18w400 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );
  static TextStyle get body14w600 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );
  static TextStyle get body15w600 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );
  static TextStyle get body10w300 => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
        color: AppColors.topTextColor,
      );
}
