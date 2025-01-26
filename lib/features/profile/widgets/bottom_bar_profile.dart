import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_images.dart';

class BottomBarProfile extends StatelessWidget {
  const BottomBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppImages.home,
              height: 30,
              width: 30,
            ),
          ),
          Image.asset(
            AppImages.search,
            height: 30,
            width: 25,
          ),
          Image.asset(
            AppImages.plus,
            height: 30,
            width: 30,
          ),
          Image.asset(
            AppImages.chatMessage,
            height: 30,
            width: 30,
          ),
          Image.asset(
            AppImages.customer,
            height: 30,
            width: 30,
          ),
        ],
      ),
    );
  }
}
