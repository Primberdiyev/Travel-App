import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/providers/images_provider.dart';
import 'package:travel_app/utilities/app_images.dart';

class BottomBarProfile extends StatefulWidget {
  const BottomBarProfile({super.key});

  @override
  State<BottomBarProfile> createState() => _BottomBarProfileState();
}

class _BottomBarProfileState extends State<BottomBarProfile> {
  @override
  void initState() {
    super.initState();
  }

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
          Consumer<ImagesProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return GestureDetector(
              onTap: () async {
                await provider.pickImage();
                await provider.uploadImageToImageKit();
              },
              child: Image.asset(
                AppImages.plus,
                height: 30,
                width: 30,
              ),
            );
          }),
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
