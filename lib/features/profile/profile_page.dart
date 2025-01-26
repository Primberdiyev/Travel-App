import 'package:flutter/material.dart';
import 'package:travel_app/core/ui_kit/custom_button.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/features/profile/widgets/bottom_bar_profile.dart';
import 'package:travel_app/features/profile/widgets/user_profile.dart';
import 'package:travel_app/features/profile/widgets/user_social_data.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.userModel,
  });
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 54,
        ),
        child: Column(
          children: [
            UserProfile(userModel: userModel),
            SizedBox(
              height: 28,
            ),
            UserSocialData(userModel: userModel),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  buttonWeight: (size.width - 60) / 2,
                  leftColor: AppColors.primary,
                  rightColor: AppColors.signInAccount,
                  text: AppTexts.editProfile,
                ),
                CustomButton(
                  buttonWeight: (size.width - 60) / 2,
                  leftColor: AppColors.primary,
                  rightColor: AppColors.signInAccount,
                  text: AppTexts.shareProfile,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(),
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.topTextColor,
                    tabs: [
                      Tab(text: AppTexts.photo),
                      Tab(text: AppTexts.video),
                      Tab(text: AppTexts.about),
                      Tab(text: AppTexts.favourite),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.53,
                    child: TabBarView(
                      children: [
                        Center(
                          child: Text(AppTexts.photo),
                        ),
                        Center(
                          child: Text(AppTexts.video),
                        ),
                        Center(
                          child: Text(AppTexts.about),
                        ),
                        Center(
                          child: Text(AppTexts.favourite),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarProfile(),
    );
  }
}
