import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/home/providers/user_provider.dart';
import 'package:travel_app/features/home/widgets/beach_image.dart';
import 'package:travel_app/features/home/widgets/build_city.dart';
import 'package:travel_app/features/home/widgets/home_page_app_bar.dart';
import 'package:travel_app/features/home/widgets/services.dart';
import 'package:travel_app/features/home/widgets/story_item.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/models_items.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
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
          ),
          SliverToBoxAdapter(
            child: BeachImage(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
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
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    );
                  },
                  itemCount: serviceItems.length,
                ),
              ),
            ),
          ),
          Consumer<UserProvider>(
            builder: (
              context,
              provider,
              child,
            ) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return StoryItem(
                      userModel: provider.allUsers[index],
                    );
                  },
                  childCount: provider.allUsers.length,
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 22,
          top: 10,
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
            GestureDetector(
              onTap: () {
                final userProvider = context.read<UserProvider>();
                Navigator.pushNamed(
                  context,
                  NameRoutes.profile,
                  arguments: userProvider.mySelf,
                );
              },
              child: SvgPicture.asset(
                AppIcons.account.icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
