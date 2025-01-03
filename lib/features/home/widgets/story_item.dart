import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.imageLink,
  });
  final String imageLink;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Dilshodbek',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
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
              image: NetworkImage(imageLink),
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
