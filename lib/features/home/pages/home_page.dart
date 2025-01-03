import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/providers/images_provider.dart';
import 'package:travel_app/features/home/providers/user_provider.dart';
import 'package:travel_app/features/home/widgets/beach_image.dart';
import 'package:travel_app/features/home/widgets/build_city.dart';
import 'package:travel_app/features/home/widgets/home_page_app_bar.dart';
import 'package:travel_app/features/home/widgets/services.dart';
import 'package:travel_app/features/home/widgets/story_item.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/models_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = context.read<UserProvider>();
    provider.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: ListView(
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
          SizedBox(height: 22),
          BeachImage(),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 22,
            ),
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Services(serviceModel: serviceItems[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                itemCount: serviceItems.length,
              ),
            ),
          ),
          Consumer<UserProvider>(
            builder: (
              context,
              provider,
              child,
            ) {
              return ListView.builder(
                  shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: provider.allUsers.length,
                itemBuilder: (context, index) {
                  return StoryItem(
                    imageLink: provider.allUsers[index].storiesId?[0] ??
                        'https://www.investopedia.com/thmb/6jYlFRblC_TSZ0lfZjDHVrjMqqI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1258889149-1f50bb87f9d54dca87813923f12ac94b.jpg',
                  );
                },
              );
            },
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
