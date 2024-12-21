import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.haveAccount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, NameRoutes.signUp);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            AppTexts.signUp,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.buttonColor,
            ),
          ),
        ),
      ],
    );
  }
}
