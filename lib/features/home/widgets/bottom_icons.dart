import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/providers/images_provider.dart';
import 'package:travel_app/utilities/app_icons.dart';

class BottomIcons extends StatelessWidget {
  const BottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            AppIcons.home.icon,
          ),
          SvgPicture.asset(
            AppIcons.search.icon,
          ),
          SvgPicture.asset(AppIcons.chatting.icon),
          ChangeNotifierProvider(
            create: (context) => ImagesProvider(),
            child: Consumer<ImagesProvider>(builder: (
              context,
              provider,
              child,
            ) {
              return GestureDetector(
                onTap: () async {
                  await provider.pickImage();
                  await provider.uploadImageToStorage();
                },
                child: SvgPicture.asset(
                  AppIcons.account.icon,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
