import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/authorization/providers/google_provider.dart';
import 'package:travel_app/features/authorization/widgets/auth_button.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';
import 'package:travel_app/utilities/statuses.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key, required this.isSignIn});
  final bool isSignIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChangeNotifierProvider(
          create: (context) => GoogleProvider(),
          child: Consumer<GoogleProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return AuthButton(
              iconPath: AppIcons.google.icon,
              onPressed: () {
                provider.signInWithGooge(isSignIn).then((_) {
                  if (provider.state == Statuses.completed && context.mounted) {
                    Navigator.pushReplacementNamed(context, NameRoutes.home);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppTexts.notRegistered),
                        ),
                      );
                    }
                  }
                });
              },
            );
          }),
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
