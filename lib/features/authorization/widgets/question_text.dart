import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.questionText,
    required this.signText,
    this.onPressed,
  });
  final String questionText;
  final String signText;
  final VoidCallback? onPressed;

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
          onPressed: onPressed,
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
