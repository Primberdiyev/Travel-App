import 'package:flutter/material.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/features/profile/widgets/user_data_item.dart';
import 'package:travel_app/utilities/app_texts.dart';

class UserSocialData extends StatelessWidget {
  const UserSocialData({super.key, required this.userModel});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        UserDataItem(
          count: userModel?.fansId.length ?? 1,
          text: AppTexts.fans,
        ),
        UserDataItem(
          count: userModel?.followingsId.length ?? 1,
          text: AppTexts.followings,
        ),
        UserDataItem(
          count: userModel?.postsId.length ?? 0,
          text: AppTexts.posts,
        ),
        UserDataItem(
          count: userModel?.storiesId.length ?? 0,
          text: AppTexts.stories,
        ),
      ],
    );
  }
}
