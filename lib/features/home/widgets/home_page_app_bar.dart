import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 29,
        right: 20,
        bottom: 25,
        top: 59,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.travel.icon,
            height: 25,
            width: 25,
          ),
          Text(
            AppTexts.travelUz,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SvgPicture.asset(AppIcons.down.icon),
          Spacer(),
          SvgPicture.asset(AppIcons.heart.icon),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 15),
            child: SvgPicture.asset(AppIcons.chat.icon),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
