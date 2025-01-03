import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_images.dart';
import 'package:travel_app/utilities/app_texts.dart';

class BeachImage extends StatelessWidget {
  const BeachImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 22,
        bottom: 13,
      ),
      padding: EdgeInsets.only(
        left: 25,
        top: 25,
      ),
      height: size.height * 0.19,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            AppImages.nature,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppTexts.beach,
            style: TextStyle(
              fontSize: 36,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            AppTexts.travelTo,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              height: 1.3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                height: 8,
                width: 8,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  right: 4,
                  left: 4,
                  top: 16,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? AppColors.white
                      : AppColors.white.withValues(alpha: 0.4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
