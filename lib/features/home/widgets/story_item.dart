import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_images.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class StoryItem extends StatefulWidget {
  const StoryItem({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.userModel.storiesId;
    final PageController controller = PageController();
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 14),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: images.first,
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
                      arguments: widget.userModel,
                    );
                  },
                  child: Text(
                    widget.userModel.name,
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
        SizedBox(
          height: 433,
          child: PageView.builder(
            controller: controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  top: 6,
                  right: 15,
                  left: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.userModel.storiesId[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 19,
            right: 25,
          ),
          child: Row(
            children: [
              Image.asset(
                AppImages.favourite,
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 37,
                  top: 11,
                  bottom: 17,
                ),
                child: Image.asset(
                  AppImages.chatMessage,
                  width: 30,
                  height: 30,
                ),
              ),
              Image.asset(
                AppImages.bookMark,
                width: 30,
                height: 30,
              ),
              Spacer(),
              Image.asset(
                AppImages.sent,
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
