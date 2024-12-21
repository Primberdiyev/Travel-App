import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utilities/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.iconPath,
    this.onPressed,
  });
  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: Size(86, 42),
        backgroundColor: AppColors.authButtonColor,
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(iconPath),
    );
  }
}
