import 'package:flutter/material.dart';
import 'package:travel_app/core/ui_kit/custom_user_avatar.dart';
import 'package:travel_app/utilities/app_colors.dart';

class BuildCity extends StatelessWidget {
  const BuildCity({
    super.key,
    required this.cityName,
    required this.imagePath,
  });
  final String cityName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomUserAvatar(
          imagePath: imagePath,
          size: 60,
        ),
        Text(
          cityName,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.black,
            fontFamily: 'Laila',
          ),
        ),
      ],
    );
  }
}
