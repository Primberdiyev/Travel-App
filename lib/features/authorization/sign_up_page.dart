import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.only(
          left: 50,
          right: 50,
          top: 67,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppIcons.back.icon),
              SvgPicture.asset(
                AppIcons.travel.icon,
                height: 25,
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.signUp,
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                AppIcons.happy.icon,
                height: 30,
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
