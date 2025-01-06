import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/ui_kit/custom_user_avatar.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_styles.dart';
import 'package:travel_app/utilities/app_texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 53, left: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(AppIcons.backIos.icon),
          ),
          SizedBox(
            width: 7,
          ),
          CustomUserAvatar(
            imageLink: userModel.storiesId?.first ?? AppTexts.defaultImage,
            size: 45,
          ),
          SizedBox(
            width: 9,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userModel.name,
                style: AppStyles.body18w400,
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.onlineColor,
                    ),
                  ),
                  Text(
                    AppTexts.online,
                    style: AppStyles.body18w400.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
