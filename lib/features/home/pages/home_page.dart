import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/providers/images_provider.dart';
import 'package:travel_app/features/home/widgets/beach_image.dart';
import 'package:travel_app/features/home/widgets/build_city.dart';
import 'package:travel_app/features/home/widgets/home_page_app_bar.dart';
import 'package:travel_app/features/home/widgets/services.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/models_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomePageAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return BuildCity(
                  cityName: cities[index].name,
                  imagePath: cities[index].imagepath,
                );
              },
            ),
          ),
          SizedBox(
            height: 22,
          ),
          BeachImage(),
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Services(serviceModel: serviceItems[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemCount: serviceItems.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
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
      ),
    );
  }
}
