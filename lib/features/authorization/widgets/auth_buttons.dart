import 'package:flutter/material.dart';
import 'package:travel_app/features/authorization/widgets/auth_button.dart';
import 'package:travel_app/utilities/app_icons.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AuthButton(
          iconPath: AppIcons.google.icon,
          onPressed: () {},
        ),
        AuthButton(
          iconPath: AppIcons.facebook.icon,
          onPressed: () {},
        ),
        AuthButton(
          iconPath: AppIcons.bird.icon,
          onPressed: () {},
        ),
      ],
    );
  }
}
