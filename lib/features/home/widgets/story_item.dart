import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/features/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final imageLink = userModel.storiesId?.first ?? AppTexts.defaultImage;
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 14),
              child: ClipOval(
                child: Image.network(
                  imageLink,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NameRoutes.chat,
                      arguments: userModel,
                    );
                  },
                  child: Text(
                    userModel.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '2 hours ago',
                  style: TextStyle(
                    color: Color(0xFF000000).withValues(alpha: 0.55),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 9),
              child: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ],
        ),
        Container(
          height: 433,
          margin: EdgeInsets.only(
            top: 6,
            right: 9,
            left: 9,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                imageLink,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.favourite.icon,
            ),
            SvgPicture.asset(AppIcons.chatMessage.icon),
            SvgPicture.asset(AppIcons.bookMark.icon),
            SvgPicture.asset(AppIcons.sent.icon),
          ],
        ),
      ],
    );
  }
}
