import 'package:flutter/material.dart';
import 'package:travel_app/core/ui_kit/custom_user_avatar.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/utilities/app_images.dart';
import 'package:travel_app/utilities/app_styles.dart';
import 'package:travel_app/utilities/app_texts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.userModel,
  });
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomUserAvatar(
            size: 70,
            imagePath: AppImages.nature,
            isWithBorder: false,
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              userModel?.name ?? 'user',
              style: AppStyles.body14w600,
            ),
            Text(
              AppTexts.phoneNumber,
              style: AppStyles.body18w400.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Spacer(),
        Image.asset(
          AppImages.more,
          height: 30,
          width: 30,
        ),
      ],
    );
  }
}
