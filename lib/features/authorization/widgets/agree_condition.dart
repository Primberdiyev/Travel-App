import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/authorization/providers/value_state_provider.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';

class AgreeCondition extends StatelessWidget {
  const AgreeCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChangeNotifierProvider(
          create: (context) => ValueStateProvider(),
          child: Consumer<ValueStateProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.buttonColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  provider.setIsAgree();
                },
                child: provider.isAgree
                    ? Icon(
                        Icons.check,
                        size: 12,
                        color: AppColors.buttonColor,
                      )
                    : null,
              ),
            );
          }),
        ),
        Text(
          AppTexts.understood,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        Text(
          AppTexts.terms,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonColor,
          ),
        ),
      ],
    );
  }
}
