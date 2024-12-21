import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.questionText,
    required this.signText,
  });
  final String questionText;
  final String signText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
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
            signText,
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
